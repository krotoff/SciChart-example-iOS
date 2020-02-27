//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2019. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIFastBandRenderableSeries.h is part of SCICHART®, High Performance Scientific Charts
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

#import "SCIXyyRenderableSeriesBase.h"

/**
 * A raster RenderableSeries type which displays two lines and shaded bands between them, where band-colors depend on whether one line is greater than the other.
 */
@interface SCIFastBandRenderableSeries : SCIXyyRenderableSeriesBase

/**
 * Gets or sets a value indicating whether lines in this band series has a `digital (step) line`.
 */
@property (nonatomic) BOOL isDigitalLine;

/**
 * Sets the stroke style the Y1 line. For the Y0 line, use `ISCIRenderableSeries.strokeStyle` property.
 */
@property (strong, nonatomic, nullable) SCIPenStyle *strokeY1Style;

/**
 * Gets or sets the fill style for the shaded area when when `Y1 < Y0`.
 */
@property (strong, nonatomic, nullable) SCIBrushStyle *fillBrushStyle;

/**
 * Gets or sets the fill style for the shaded area when when `Y1 > Y0`.
 */
@property (strong, nonatomic, nullable) SCIBrushStyle *fillY1BrushStyle;

@end
