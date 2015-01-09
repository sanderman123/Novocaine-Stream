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


#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) RingBuffer *ringBuffer;

@end

@implementation ViewController

- (void)dealloc
{
    delete self.ringBuffer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self setupSocket];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    __weak ViewController * wself = self;

    self.ringBuffer = new RingBuffer(2048, 2);
    self.audioManager = [Novocaine audioManager];

    
    // Basic playthru example
//    [self.audioManager setInputBlock:^(float *data, UInt32 numFrames, UInt32 numChannels) {
//        float volume = 0.5;
//        vDSP_vsmul(data, 1, &volume, data, 1, numFrames*numChannels);
//        wself.ringBuffer->AddNewInterleavedFloatData(data, numFrames, numChannels);
//    }];
    
    
//    [self.audioManager setOutputBlock:^(float *outData, UInt32 numFrames, UInt32 numChannels) {
//        wself.ringBuffer->FetchInterleavedData(outData, numFrames, numChannels);
//    }];
    
    
     // MAKE SOME NOOOOO OIIIISSSEEE
    // ==================================================
//     [self.audioManager setOutputBlock:^(float *newdata, UInt32 numFrames, UInt32 thisNumChannels)
//         {
//             for (int i = 0; i < numFrames * thisNumChannels; i++) {
//                 newdata[i] = (rand() % 100) / 100.0f / 2;
//         }
//     }];
    
    
    // MEASURE SOME DECIBELS!
    // ==================================================
//    __block float dbVal = 0.0;
//    [self.audioManager setInputBlock:^(float *data, UInt32 numFrames, UInt32 numChannels) {
//
//        vDSP_vsq(data, 1, data, 1, numFrames*numChannels);
//        float meanVal = 0.0;
//        vDSP_meanv(data, 1, &meanVal, numFrames*numChannels);
//
//        float one = 1.0;
//        vDSP_vdbcon(&meanVal, 1, &one, &meanVal, 1, 1, 0);
//        dbVal = dbVal + 0.2*(meanVal - dbVal);
//        printf("Decibel level: %f\n", dbVal);
//        
//    }];
    
    // SIGNAL GENERATOR!
//    __block float frequency = 2000.0;
//    __block float phase = 0.0;
//    [self.audioManager setOutputBlock:^(float *data, UInt32 numFrames, UInt32 numChannels)
//     {
//
//         float samplingRate = wself.audioManager.samplingRate;
//         for (int i=0; i < numFrames; ++i)
//         {
//             for (int iChannel = 0; iChannel < numChannels; ++iChannel) 
//             {
//                 float theta = phase * M_PI * 2;
//                 data[i*numChannels + iChannel] = sin(theta);
//             }
//             phase += 1.0 / (samplingRate / frequency);
//             if (phase > 1.0) phase = -1;
//         }
//     }];
    
    
    // DALEK VOICE!
    // (aka Ring Modulator)
    
//    [self.audioManager setInputBlock:^(float *data, UInt32 numFrames, UInt32 numChannels)
//     {
//         wself.ringBuffer->AddNewInterleavedFloatData(data, numFrames, numChannels);
//     }];
//    
//    __block float frequency = 100.0;
//    __block float phase = 0.0;
//    [self.audioManager setOutputBlock:^(float *data, UInt32 numFrames, UInt32 numChannels)
//     {
//         wself.ringBuffer->FetchInterleavedData(data, numFrames, numChannels);
//         
//         float samplingRate = wself.audioManager.samplingRate;
//         for (int i=0; i < numFrames; ++i)
//         {
//             for (int iChannel = 0; iChannel < numChannels; ++iChannel) 
//             {
//                 float theta = phase * M_PI * 2;
//                 data[i*numChannels + iChannel] *= sin(theta);
//             }
//             phase += 1.0 / (samplingRate / frequency);
//             if (phase > 1.0) phase = -1;
//         }
//     }];
//    
    
    // VOICE-MODULATED OSCILLATOR
    
//    __block float magnitude = 0.0;
//    [self.audioManager setInputBlock:^(float *data, UInt32 numFrames, UInt32 numChannels)
//     {
//         vDSP_rmsqv(data, 1, &magnitude, numFrames*numChannels);
//     }];
//    
//    __block float frequency = 100.0;
//    __block float phase = 0.0;
//    [self.audioManager setOutputBlock:^(float *data, UInt32 numFrames, UInt32 numChannels)
//     {
//
//         printf("Magnitude: %f\n", magnitude);
//         float samplingRate = wself.audioManager.samplingRate;
//         for (int i=0; i < numFrames; ++i)
//         {
//             for (int iChannel = 0; iChannel < numChannels; ++iChannel) 
//             {
//                 float theta = phase * M_PI * 2;
//                 data[i*numChannels + iChannel] = magnitude*sin(theta);
//             }
//             phase += 1.0 / (samplingRate / (frequency));
//             if (phase > 1.0) phase = -1;
//         }
//     }];
    
    
    // AUDIO FILE READING OHHH YEAHHHH
    // ========================================    
//    NSURL *inputFileURL = [[NSBundle mainBundle] URLForResource:@"TLC" withExtension:@"mp3"];        
//
//        self.fileReader = [[AudioFileReader alloc]
//                           initWithAudioFileURL:inputFileURL 
//                           samplingRate:self.audioManager.samplingRate
//                           numChannels:self.audioManager.numOutputChannels];
//    
//    [self.fileReader play];
//    self.fileReader.currentTime = 30.0;
//    
//    
//    [self.audioManager setOutputBlock:^(float *data, UInt32 numFrames, UInt32 numChannels)
//     {
//         [wself.fileReader retrieveFreshAudio:data numFrames:numFrames numChannels:numChannels];
//         NSLog(@"Time: %f", wself.fileReader.currentTime);
//     }];
    
    // AUDIO FILE WRITING YEAH!
    // ========================================    
//    NSArray *pathComponents = [NSArray arrayWithObjects:
//                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject], 
//                               @"My Recording.m4a", 
//                               nil];
//    NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
//    NSLog(@"URL: %@", outputFileURL);
//    
//    self.fileWriter = [[AudioFileWriter alloc]
//                       initWithAudioFileURL:outputFileURL 
//                       samplingRate:self.audioManager.samplingRate
//                       numChannels:self.audioManager.numInputChannels];
//    
//    
//    __block int counter = 0;
//    self.audioManager.inputBlock = ^(float *data, UInt32 numFrames, UInt32 numChannels) {
//        [wself.fileWriter writeNewAudio:data numFrames:numFrames numChannels:numChannels];
//        counter += 1;
//        if (counter > 400) { // roughly 5 seconds of audio
//            wself.audioManager.inputBlock = nil;
//        }
//    };

    // START IT UP YO
    [self.audioManager play];

}

- (void)setupSocket{
    tag = 0;
    udpSocket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    NSError *error = nil;
    
    if (![udpSocket bindToPort:0 error:&error])
    {
        NSLog(@"Error binding: %@", error);
        return;
    }
    if (![udpSocket beginReceiving:&error])
    {
        NSLog(@"Error receiving: %@", error);
        return;
    }
    
    NSLog(@"Socket Ready");
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data fromAddress:(NSData *)address withFilterContext:(id)filterContext {
    //For now see the data as text
    NSString *msg = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if (msg)
    {
        NSLog(@"RECV: %@", msg);
    }
    else
    {
        //We received audio data, so lets play it!
        float *audio = [self decodeFloat:data];
//        ringBuffer->AddNewInterleavedFloatData(data, numFrames, numChannels);
        _ringBuffer->AddNewInterleavedFloatData(audio, 128, 2);
        
        [self.audioManager setOutputBlock:^(float *outData, UInt32 numFrames, UInt32 numChannels) {
            _ringBuffer->FetchInterleavedData(outData, numFrames, numChannels);
        }];

        
        NSString *host = nil;
        uint16_t port = 0;
        [GCDAsyncUdpSocket getHost:&host port:&port fromAddress:address];
        
        NSLog(@"RECV: Unknown message from: %@:%hu", host, port);
    }

}

- (float *)decodeFloat:(NSData *)data {
    //2 is the number of channels here!!
    float *d = (float *)malloc(sizeof(float) * 2);
    [data getBytes:&d length:sizeof(data)];
    return d;
}


- (IBAction)btnSendClicked:(id)sender {
    NSString *host = _tfIPAddress.text;
    if ([host length] == 0)
    {
        NSLog(@"Error, address required");
        return;
    }
    
    int port = [_tfPort.text intValue];
    if (port <= 0 || port > 65535)
    {
        NSLog(@"Error, valid port required");
        return;
    }
    
    NSString *msg = _tfMessage.text;
    if ([msg length] == 0)
    {
        NSLog(@"Error message required");
        return;
    }
    
    NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
    [udpSocket sendData:data toHost:host port:port withTimeout:-1 tag:tag];
    
    NSLog(@"SENT (%i): %@", (int)tag, msg);
    
    tag++;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)clickedBackground{
    [self.view endEditing:YES];
}


@end
