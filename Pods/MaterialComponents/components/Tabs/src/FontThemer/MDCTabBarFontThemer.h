// Copyright 2018-present the Material Components for iOS authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "MaterialTabs.h"
#import "MaterialThemes.h"

#pragma mark - Soon to be deprecated

/**
 Used to apply a font scheme to theme MDCTabBar.

 @warning This API will eventually be deprecated. See the individual method documentation for
 details on replacement APIs.
 Learn more at docs/theming.md#migration-guide-themers-to-theming-extensions
 */
@interface MDCTabBarFontThemer : NSObject
@end

@interface MDCTabBarFontThemer (ToBeDeprecated)

/**
 Applies a font scheme to theme a MDCTabBar.

 @param fontScheme The font scheme to apply to MDCTabBar.
 @param tabBar A MDCTabBar instance to apply a color scheme.

 @warning This API will eventually be deprecated. The replacement API is any `MDCTabBar` theming
 extension.
 Learn more at docs/theming.md#migration-guide-themers-to-theming-extensions
 */
+ (void)applyFontScheme:(nonnull id<MDCFontScheme>)fontScheme toTabBar:(nonnull MDCTabBar *)tabBar;

@end
