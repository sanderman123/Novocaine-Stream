//
//  Server.m
//  EZAudioPassThroughExample
//
//  Created by Sander on 11/25/14.
//  Copyright (c) 2014 Syed Haris Ali. All rights reserved.
//

#import "Server.h"

@implementation Server

- (void) createServerOnPort: (UInt16) p {
    port = p;
    udpSocket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    NSError *error = [NSError alloc];
    if (![udpSocket bindToPort:port error:&error]) {
        NSLog(@"Error binding port: %@", error.localizedDescription);
    } else {
        NSLog(@"Port binding succeeded");
    }
    
    if (![udpSocket beginReceiving:&error]){
        NSLog(@"Error starting receiving: %@", error.localizedDescription);
    } else {
        NSLog(@"Succesfully started receiving");
    }
    
    clients = [[NSMutableArray alloc] init];
    tag = 0;
    
    NSLog(@"UDP server started on port %i", port);
}

- (void) send: (NSData *) data {
    for (NSData *address in clients){
        [udpSocket sendData:data toAddress:address withTimeout:-1 tag:tag];
        tag++;
    }
}

- (void) udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data fromAddress:(NSData *)address withFilterContext:(id)filterContext {
    
    NSLog(@"Received data with length: %lu", (unsigned long)data.length);
    
    NSLog(@"Data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
    BOOL known = false;
    for (NSData *c in clients){
        if([c isEqualToData:address]){
            known = true;
            break;
        }
    }
    if (!known) {
        [clients addObject:address];
        NSLog(@"New client added: %@", address.debugDescription);
    }
}

@end
