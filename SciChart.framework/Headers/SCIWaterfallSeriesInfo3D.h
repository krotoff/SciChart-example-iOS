//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2019. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIWaterfallSeriesInfo3D.h is part of SCICHART®, High Performance Scientific Charts
// For full terms and conditions of the license, see http://www.scichart.com/scichart-eula/
//
// This source code is protected by international copyright law. Unauthorized
// reproduction, reverse-engineering, or distribution of all or any portion of
// this source code is strictly prohibited.
//
// This source code contains confidential and proprietary trade secrets of
// SciChart Ltd., and should at no time be copied, transferred, sold,
// distributed or made available without express written permission.
//******************************************************************************

#import "SCISeriesInfo3D.h"
#import "SCIWaterfallRenderableSeries3D.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Defines a class which contains information about a `SCIWaterfallRenderableSeries3D`, such as name, value, color based on `SCIHitTestInfo3D` values.
 */
@interface SCIWaterfallSeriesInfo3D : SCISeriesInfo3D

/**
 * The `x-index` of point which was hit in case of grid data.
 */
@property (nonatomic) int xIndex;

/**
 * The `z-index` of point which was hit in case of grid data.
 */
@property (nonatomic) int zIndex;

/**
 * Creates a new instance of `SCIWaterfallSeriesInfo3D` class.
 * @param series The associated parent `SCIWaterfallRenderableSeries3D` series.
 */
- (instancetype)initWithSeries:(SCIWaterfallRenderableSeries3D *)series;

@end

NS_ASSUME_NONNULL_END
