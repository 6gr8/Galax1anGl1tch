#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <CoreData/CoreData.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreImage/CoreImage.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMedia/CoreMedia.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreText/CoreText.h>
#import <AVFoundation/AVFoundation.h>
#import <WebKit/WebKit.h>
#import <NotificationCenter/NotificationCenter.h>
#import <AppKit/AppKit.h>
#import <AddressBook/AddressBook.h>
#import <EventKit/EventKit.h>
#import <ImageIO/ImageIO.h>
#import <Security/Security.h>
#import <ServiceManagement/ServiceManagement.h>
#import <StoreKit/StoreKit.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <libxml/xmlreader.h>
#import <libxml/xmlwriter.h>
#import <sqlite3.h>
#import "Galax1anGl1tch.h"
#define R "\e[0;31m"
#define G "\e[0;32m"
#define Y "\e[0;33m"
#define r "\e[0m"




NSString *cmmd(NSString *command){
//    NSString *command = @"/usr/local/bin/idevice_id -l";
    NSPipe *pipe = [NSPipe pipe];
    NSFileHandle *file = pipe.fileHandleForReading;
    NSTask *task = [[NSTask alloc] init];
    task.launchPath = @"/bin/sh";
    task.arguments = @[@"-c", command];
    task.standardOutput = pipe;
    [task launch];
    [task waitUntilExit];
    NSData *data = [file readDataToEndOfFile];
    NSString *output = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return output;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        system("clear");
        Galax1anGl1tch *myinput = [[Galax1anGl1tch alloc]init];
        [myinput gal];
        BOOL deviceFound = NO;
        while (1) {
            if (!deviceFound) {
                printf(Y"[+] Please connect the USB.\n"r);
                printf(Y"[+] When it's ready , press Enter"r);
                getchar();
            }
            NSString *check = cmmd(@"/usr/local/bin/idevicename");
            if (check.length > 0) {
                printf(G"[+] Found : %s"r, [check UTF8String]);
                char askforinput[100];
                printf(Y"[+] Enter Command :"r);
                scanf("%s", askforinput);
                NSString *ourinput = [NSString stringWithUTF8String:askforinput];
                if([ourinput isEqualToString:@"-apps"]){
                    printf("[-] Command My-Apps [ Wait ... ]");
                    system("clear");
                    printf("[-] - [ Wait ... ]");
                    printf("[-] -- [ Wait ... ]");
                    printf("[-] --- [ Wait ... ]");
                    system("clear");
                    printf("[-] ---- [ Wait ... ]");
                    printf("[-] ----- [ Wait ... ]");
                    system("clear");
                    NSString *commands = @"/usr/local/bin/ideviceinstaller -l";
                    system([commands UTF8String]);
                }else if ([ourinput isEqualToString:@"-ipa"]){
                    printf(Y"[+] Enter Path Of .iPA :"r);
                    scanf("%s",askforinput);
                    NSString *inp = [NSString stringWithFormat:@"ideviceinstaller -i %s",askforinput];
                    NSString *ch = cmmd(inp);
                    if(ch.length >0){
                        printf(G"[+] Done Check Your Phone/iPad"r);
                    }else{
                        printf(R"[+] Error Check The Path/iPA"r);
                    }
                }else if ([ourinput isEqualToString:@"g-ipa"]){
                    char pathipa[1000];
                    printf(Y"[+] Path Of Ipa In Your Phone :."r);
                    scanf("%s",pathipa);
                    char ip[15];
                    printf(Y"[+] Enter iP :."r);
                    scanf("%s",ip);
                    NSString *getipafiles = [NSString stringWithFormat:@"scp root@%s:%s ~/Desktop/",ip,pathipa];
                    NSString *ch = cmmd(getipafiles);
                    if(ch.length > 0){
                        printf(G"[+] Done Check Your Desktop."r);
                    }else{
                        printf(G"[+] Error Check Your iP/ssh/path."r);
                    }
                }else if ([ourinput isEqualToString:@"g-folder"]){
                    char pathfolder[1000];
                    printf(Y"[+] Path Of Folder :."r);
                    scanf("%s",pathfolder);
                    char ip[15];
                    printf(Y"[+] Enter iP :."r);
                    scanf("%s",ip);
                    NSString *getfolders = [NSString stringWithFormat:@"scp -r root@%s:%s ~/Desktop/",ip,pathfolder];
                    
                    NSString *ch = cmmd(getfolders);
                    if(ch.length > 0){
                        printf(G"[+] Done Check Your Desktop."r);
                    }else{
                        printf(G"[+] Error Check Your iP/ssh/path."r);
                    }
                }else if ([ourinput isEqualToString:@"DeNsor"]){
                    printf(G"[+] iNSTAGRAM , GITHUB ==> @6gr8"r);
                }
                else {
                    printf(R"[+] Error Commands : [ %s ]."r,[ourinput UTF8String]);
                }
                deviceFound = YES;
            } else {
                printf(R"[+] No device found.\n"r);
                deviceFound = NO;
            }
        }
    }

    return 0;
}

