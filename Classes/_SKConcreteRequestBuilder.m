//
//  _SKConcreteRequestBuilder.m
//  StackKit
//
//  Created by Dave DeLong on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "_SKConcreteRequestBuilder.h"

@interface _SKConcreteRequestBuilder ()

@property (nonatomic, retain) NSError * error;

@end


@implementation _SKConcreteRequestBuilder
@synthesize fetchRequest;
@synthesize error;
@synthesize query;
@synthesize path;

- (id) initWithFetchRequest:(SKFetchRequest *)request {
	self = [super init];
	if (self) {
		fetchRequest = [request retain];
		query = [[NSMutableDictionary alloc] init];
		
		[query setObject:[[request site] apiKey] forKey:SKSiteAPIKey];
		
		if ([request fetchLimit] > 0) {
			[query setObject:[NSNumber numberWithUnsignedInteger:[request fetchLimit]] forKey:SKQueryPageSize];
			NSUInteger page = ([request fetchOffset] / [request fetchLimit]) + 1;
			[query setObject:[NSNumber numberWithUnsignedInteger:page] forKey:SKQueryPage];
		}
	}
	return self;
}

- (void) dealloc {
	[fetchRequest release];
	[error release];
	[query release];
	[path release];
	[super dealloc];
}

+ (Class) recognizedFetchEntity { return nil; }
+ (BOOL) recognizesAPredicate { return YES; }
+ (NSSet *) recognizedPredicateKeyPaths { return [NSSet set]; }
+ (NSSet *) requiredPredicateKeyPaths { return [NSSet set]; }
+ (NSSet *) recognizedSortDescriptorKeys { return [NSSet set]; }

- (NSURL *) URL {
	[self setError:[NSError errorWithDomain:SKErrorDomain code:SKErrorCodeNotImplemented userInfo:nil]];
	return nil;
}

@end
