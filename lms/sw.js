/* =========================================================
   ANSHA MONTESSORI LMS — SERVICE WORKER
   Offline-first caching strategy
   ========================================================= */

const CACHE_NAME = 'ansha-lms-v1';
const STATIC_ASSETS = [
  '/lms/index.html',
  '/lms/student/dashboard.html',
  '/lms/student/my-courses.html',
  '/lms/student/courses.html',
  '/lms/student/lesson.html',
  '/lms/student/assignments.html',
  '/lms/student/results.html',
  '/lms/student/recordings.html',
  '/lms/student/profile.html',
  '/lms/student/calendar.html',
  '/lms/student/schedule.html',
  '/lms/student/leaderboard.html',
  '/lms/admin/dashboard.html',
  '/lms/assets/css/main.css',
  '/lms/assets/css/dashboard.css',
  '/lms/assets/css/components.css',
  '/lms/assets/js/data.js',
  '/lms/assets/js/auth.js',
  '/lms/assets/js/utils.js',
  '/lms/assets/js/supabase.js',
];

// Install: cache static assets
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME).then(cache => {
      return Promise.allSettled(
        STATIC_ASSETS.map(url => cache.add(url).catch(() => {}))
      );
    }).then(() => self.skipWaiting())
  );
});

// Activate: remove old caches
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(keys =>
      Promise.all(keys.filter(k => k !== CACHE_NAME).map(k => caches.delete(k)))
    ).then(() => self.clients.claim())
  );
});

// Fetch: cache-first for static, network-first for API
self.addEventListener('fetch', event => {
  const url = new URL(event.request.url);

  // Skip non-GET and external requests (Supabase, CDN fonts)
  if (event.request.method !== 'GET') return;
  if (url.hostname !== self.location.hostname) return;

  event.respondWith(
    caches.match(event.request).then(cached => {
      if (cached) {
        // Serve cache, refresh in background
        fetch(event.request).then(res => {
          if (res && res.status === 200) {
            caches.open(CACHE_NAME).then(cache => cache.put(event.request, res));
          }
        }).catch(() => {});
        return cached;
      }
      // Not cached — try network, cache on success
      return fetch(event.request).then(res => {
        if (res && res.status === 200 && res.type === 'basic') {
          const clone = res.clone();
          caches.open(CACHE_NAME).then(cache => cache.put(event.request, clone));
        }
        return res;
      }).catch(() => {
        // Offline fallback
        if (event.request.destination === 'document') {
          return caches.match('/lms/index.html');
        }
      });
    })
  );
});

// Push notifications (future use)
self.addEventListener('push', event => {
  const data = event.data ? event.data.json() : { title: 'Ansha LMS', body: 'You have a new notification' };
  event.waitUntil(
    self.registration.showNotification(data.title || 'Ansha LMS', {
      body: data.body || '',
      icon: '/lms/assets/icon-192.png',
      badge: '/lms/assets/icon-192.png',
      data: { url: data.url || '/lms/index.html' }
    })
  );
});

self.addEventListener('notificationclick', event => {
  event.notification.close();
  event.waitUntil(clients.openWindow(event.notification.data.url || '/lms/index.html'));
});
