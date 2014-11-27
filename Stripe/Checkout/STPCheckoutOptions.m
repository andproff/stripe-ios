//
//  STPCheckoutOptions.m
//  StripeExample
//
//  Created by Jack Flintermann on 10/6/14.
//  Copyright (c) 2014 Stripe. All rights reserved.
//

#import "STPCheckoutOptions.h"
#import "Stripe.h"
#import "STPColorUtils.h"

@implementation STPCheckoutOptions

- (instancetype)init {
    self = [super init];
    if (self) {
        _publishableKey = [Stripe defaultPublishableKey];
        _companyName = [[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"];
    }
    return self;
}

- (NSString *)stringifiedJSONRepresentation {
    NSMutableDictionary *values = [NSMutableDictionary dictionary];
    if (self.publishableKey) {
        values[@"publishableKey"] = self.publishableKey;
    }
    if (self.logoURL) {
        values[@"logoURL"] = [self.logoURL absoluteString];
    }
    if (self.logoColor) {
        values[@"logoColor"] = [STPColorUtils hexCodeForColor:self.logoColor];
    }
    if (self.companyName) {
        values[@"companyName"] = self.companyName;
    }
    if (self.purchaseDescription) {
        values[@"purchaseDescription"] = self.purchaseDescription;
    }
    if (self.purchaseAmount) {
        values[@"purchaseAmount"] = self.purchaseAmount;
    }
    if (self.customerEmail) {
        values[@"customerEmail"] = self.customerEmail;
    }
    if (self.purchaseLabel) {
        values[@"purchaseLabel"] = self.purchaseLabel;
    }
    if (self.purchaseCurrency) {
        values[@"purchaseCurrency"] = [self.purchaseCurrency uppercaseString];
    }
    if (self.enableRememberMe) {
        values[@"enableRememberMe"] = self.enableRememberMe;
    }
    if (self.enablePostalCode) {
        values[@"enablePostalCode"] = self.enablePostalCode;
    }
    if (self.requireBillingAddress) {
        values[@"requireBillingAddress"] = self.requireBillingAddress;
    }

    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:values options:0 error:nil] encoding:NSUTF8StringEncoding];
}

#pragma mark - NSCopying

- (id)copyWithZone:(__unused NSZone *)zone {
    STPCheckoutOptions *options = [[[self class] alloc] init];
    options.publishableKey = self.publishableKey;
    options.logoURL = self.logoURL;
    options.logoImage = self.logoImage;
    options.logoColor = self.logoColor;
    options.companyName = self.companyName;
    options.purchaseDescription = self.purchaseDescription;
    options.purchaseAmount = self.purchaseAmount;
    options.customerEmail = self.customerEmail;
    options.purchaseLabel = self.purchaseLabel;
    options.purchaseCurrency = self.purchaseCurrency;
    options.enableRememberMe = self.enableRememberMe;
    options.enablePostalCode = self.enablePostalCode;
    options.requireBillingAddress = self.requireBillingAddress;
    return options;
}

@end
