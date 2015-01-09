// Copyright (c) 2012 Alex Wiltschko
// 
// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use,
// copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following
// conditions:
// 
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.

#import <Cocoa/Cocoa.h>
#import "Novocaine.h"
#import "RingBuffer.h"
#import "AudioFileReader.h"
#import "AudioFileWriter.h"
#import "GCDAsyncUdpSocket.h"
#import "Server.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>{
    BOOL serverStarted;
    BOOL streaming;
}

@property (nonatomic, strong) Novocaine *audioManager;
@property (nonatomic, strong) AudioFileReader *fileReader;
@property (nonatomic, strong) AudioFileWriter *fileWriter;
@property (nonatomic, assign) RingBuffer * ringBuffer;

@property (nonatomic,strong) Server* server;

@property (nonatomic, weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSSlider *sliderLeft;
@property (weak) IBOutlet NSSlider *sliderRight;
@property (weak) IBOutlet NSButtonCell *btnStartServer;
@property (weak) IBOutlet NSButton *btnStartStream;
@property (weak) IBOutlet NSTextField *tfPort;
- (IBAction)sliderLeftValueChanged:(id)sender;
- (IBAction)sliderRightValueChanged:(id)sender;
- (IBAction)btnStartServerClicked:(id)sender;
- (IBAction)btnStartStreamClicked:(id)sender;

- (NSData *) encodeFloat: (float *) abl;
- (float *) decodeFloat: (NSData *) data;
@end