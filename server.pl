#!/usr/bin/perl
use strict;
use warnings;
use HTTP::Daemon;
use HTTP::Status;
use File::Basename;

my $root = dirname(__FILE__);
my $d = HTTP::Daemon->new(LocalPort => 3000, ReuseAddr => 1) or die "Cannot start: $!";
print "LMS server running at http://localhost:3000/\n";
$|=1;

my %mime = (
  html => 'text/html', css  => 'text/css',
  js   => 'application/javascript', json => 'application/json',
  png  => 'image/png',  jpg  => 'image/jpeg',
  svg  => 'image/svg+xml', ico => 'image/x-icon',
  woff2=> 'font/woff2', woff => 'font/woff', ttf => 'font/ttf',
);

while (my $c = $d->accept) {
  while (my $r = $c->get_request) {
    my $path = $r->uri->path;
    $path = '/index.html' if $path eq '/';
    $path =~ s|/+|/|g;
    $path =~ s|\.\./||g;
    my $file = $root . $path;
    if (-f $file) {
      my ($ext) = $file =~ /\.(\w+)$/;
      my $type = $mime{lc($ext) // ''} // 'application/octet-stream';
      open my $fh, '<:raw', $file or do { $c->send_error(RC_FORBIDDEN); next; };
      local $/; my $body = <$fh>; close $fh;
      my $res = HTTP::Response->new(200);
      $res->header('Content-Type' => $type);
      $res->content($body);
      $c->send_response($res);
    } else {
      $c->send_error(RC_NOT_FOUND);
    }
  }
  $c->close;
}
