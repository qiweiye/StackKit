//
//  SKSiteManager+Private.h
//  StackKit
//
//  Created by Alex Rozanski on 12/02/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

@interface SKSiteManager ()
- (void)fetchSites;

- (SKSite*)metaSiteForSite:(SKSite*)aSite;
- (SKSite*)mainSiteForSite:(SKSite*)aSite;
- (SKSite*)companionSiteForSite:(SKSite*)aSite;

- (NSString *)applicationSupportDirectory;
@end