//
//  UIImage+Expand.m
//  工具类
//
//  Created by 汤圆 on 2018/7/7.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "UIImage+Expand.h"

@implementation UIImage (Expand)



- (UIImage*)transformWidth:(CGFloat)width height:(CGFloat)height
{
    CGFloat destW = width;
    CGFloat destH = height;
    CGFloat sourceW = width;
    CGFloat sourceH = height;
    
    CGImageRef imageRef = self.CGImage;
    CGContextRef bitmap = CGBitmapContextCreate(NULL,
                                                destW,
                                                destH,
                                                CGImageGetBitsPerComponent(imageRef),
                                                4*destW,
                                                CGImageGetColorSpace(imageRef),
                                                (kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst));
    
    CGContextDrawImage(bitmap, CGRectMake(0, 0, sourceW, sourceH), imageRef);
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    UIImage *resultImage = [UIImage imageWithCGImage:ref];
    CGContextRelease(bitmap);
    CGImageRelease(ref);
    
    return resultImage;
}

- (UIImage *)ll_roundImageSize:(CGSize)size radius:(NSInteger)radius{
    int w = size.width;
    int h = size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    //CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, radius, radius);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), self.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    UIImage *img = [UIImage imageWithCGImage:imageMasked];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageMasked);
    return img;
}

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth, float ovalHeight){
    float fw, fh;
    if (ovalWidth == 0 || ovalHeight == 0){
        CGContextAddRect(context, rect);
        return;
    }
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    //根据圆角路径绘制
    CGContextMoveToPoint(context, fw, fh/2);
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1);
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

// 压缩图片
- (NSData *)compressImage:(UIImage *)image
{
	UIImage *newImage = [self fixOrientation:image];
	CGSize size = [self scaleSize:newImage.size];
	UIGraphicsBeginImageContext(size);
	[image drawInRect:CGRectMake(0, 0, size.width, size.height)];
	UIImage * scaledImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();

	NSUInteger maxFileSize = 500 * 1024;
	CGFloat compressionRatio = 0.7f;
	CGFloat maxCompressionRatio = 0.1f;

	NSUInteger imageSize = UIImageJPEGRepresentation(scaledImage, 1).length;
	NSData *imageData = nil;
	if (imageSize > 1024*500)
	{
		imageData = UIImageJPEGRepresentation(scaledImage, compressionRatio);
		while (imageData.length > maxFileSize && compressionRatio > maxCompressionRatio) {
			compressionRatio -= 0.1f;
			imageData = UIImageJPEGRepresentation(newImage, compressionRatio);
		}
	}
	else
	{
		imageData = UIImageJPEGRepresentation(scaledImage, 1);
	}

	return imageData;
}

// 截图
- (UIImage *)getPartOfImage:(UIImage *)img
{
	if (!img)
	{
		return [UIImage imageNamed:@"offLine.png"];
	}
	CGImageRef imageRef = img.CGImage;
	CGFloat wOfImg = img.size.width;
	CGFloat hOfImg = img.size.height;
	if (hOfImg < wOfImg)
	{
		CGRect partRect = CGRectMake((wOfImg - hOfImg) / 2.0, 0, hOfImg, hOfImg);
		CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef, partRect);
		UIImage *retImg = [UIImage imageWithCGImage:imagePartRef];
		CGImageRelease(imagePartRef);
		return retImg;
	}
	CGRect partRect = CGRectMake(0, (img.size.height - wOfImg) / 2.0, wOfImg, wOfImg);
	CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef, partRect);
	UIImage *retImg = [UIImage imageWithCGImage:imagePartRef];
	CGImageRelease(imagePartRef);
	return retImg;
}

-(UIImage *)partOfImage:(UIImage *)img size:(CGSize)size
{
	if (!img)
	{
		return [UIImage imageNamed:@"Default-568h.png"];
	}
	CGImageRef imageRef = img.CGImage;
	CGFloat wOfImg = img.size.width;
	CGFloat hOfImg = img.size.height;

	if (size.width / wOfImg < size.height / hOfImg)
	{
		CGFloat width = size.width / (size.height / hOfImg);
		CGRect partRect = CGRectMake((wOfImg - width) / 2.0, 0, width, hOfImg);
		CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef, partRect);
		UIImage *retImg = [UIImage imageWithCGImage:imagePartRef];
		CGImageRelease(imagePartRef);
		return retImg;
	}
	else
	{
		CGFloat height = size.height / (size.width / wOfImg);
		if (hOfImg - height != 0)
		{
			CGRect partRect = CGRectMake(0, (hOfImg - height) / 2.0, wOfImg, height);
			CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef, partRect);
			UIImage *retImg = [UIImage imageWithCGImage:imagePartRef];
			CGImageRelease(imagePartRef);
			return retImg;
		}
		else
		{
			CGRect partRect = CGRectMake(0, 0, wOfImg, height);
			CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef, partRect);
			UIImage *retImg = [UIImage imageWithCGImage:imagePartRef];
			CGImageRelease(imagePartRef);
			return retImg;
		}
	}
}





- (UIImage *)fixOrientation:(UIImage *)aImage {

	// No-op if the orientation is already correct
	if (aImage.imageOrientation == UIImageOrientationUp)
		return aImage;

	// We need to calculate the proper transformation to make the image upright.
	// We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
	CGAffineTransform transform = CGAffineTransformIdentity;

	switch (aImage.imageOrientation) {
		case UIImageOrientationDown:
		case UIImageOrientationDownMirrored:
			transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
			transform = CGAffineTransformRotate(transform, M_PI);
			break;

		case UIImageOrientationLeft:
		case UIImageOrientationLeftMirrored:
			transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
			transform = CGAffineTransformRotate(transform, M_PI_2);
			break;

		case UIImageOrientationRight:
		case UIImageOrientationRightMirrored:
			transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
			transform = CGAffineTransformRotate(transform, -M_PI_2);
			break;
		default:
			break;
	}

	switch (aImage.imageOrientation) {
		case UIImageOrientationUpMirrored:
		case UIImageOrientationDownMirrored:
			transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
			transform = CGAffineTransformScale(transform, -1, 1);
			break;

		case UIImageOrientationLeftMirrored:
		case UIImageOrientationRightMirrored:
			transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
			transform = CGAffineTransformScale(transform, -1, 1);
			break;
		default:
			break;
	}

	// Now we draw the underlying CGImage into a new context, applying the transform
	// calculated above.
	CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
											 CGImageGetBitsPerComponent(aImage.CGImage), 0,
											 CGImageGetColorSpace(aImage.CGImage),
											 CGImageGetBitmapInfo(aImage.CGImage));
	CGContextConcatCTM(ctx, transform);
	switch (aImage.imageOrientation) {
		case UIImageOrientationLeft:
		case UIImageOrientationLeftMirrored:
		case UIImageOrientationRight:
		case UIImageOrientationRightMirrored:
			// Grr...
			CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
			break;

		default:
			CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
			break;
	}

	// And now we just create a new UIImage from the drawing context
	CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
	UIImage *img = [UIImage imageWithCGImage:cgimg];
	CGContextRelease(ctx);
	CGImageRelease(cgimg);
	return img;
}

- (CGSize)scaleSize:(CGSize)sourceSize
{
	float width = sourceSize.width;
	float height = sourceSize.height;
	if (width >= height) {
		return CGSizeMake(800, 800 * height / width);
	} else {
		return CGSizeMake(800 * width / height, 800);
	}
}


- (UIColor *)colorAtPoint:(CGPoint )point
{
	if (point.x < 0 || point.y < 0) return nil;

	CGImageRef imageRef = self.CGImage;
	NSUInteger width = CGImageGetWidth(imageRef);
	NSUInteger height = CGImageGetHeight(imageRef);
	if (point.x >= width || point.y >= height) return nil;

	unsigned char *rawData = malloc(height * width * 4);
	if (!rawData) return nil;

	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	NSUInteger bytesPerPixel = 4;
	NSUInteger bytesPerRow = bytesPerPixel * width;
	NSUInteger bitsPerComponent = 8;
	CGContextRef context = CGBitmapContextCreate(rawData,
												 width,
												 height,
												 bitsPerComponent,
												 bytesPerRow,
												 colorSpace,
												 kCGImageAlphaPremultipliedLast
												 | kCGBitmapByteOrder32Big);
	if (!context) {
		free(rawData);
		return nil;
	}
	CGColorSpaceRelease(colorSpace);
	CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
	CGContextRelease(context);

	int byteIndex = (bytesPerRow * point.y) + point.x * bytesPerPixel;
	CGFloat red   = (rawData[byteIndex]     * 1.0) / 255.0;
	CGFloat green = (rawData[byteIndex + 1] * 1.0) / 255.0;
	CGFloat blue  = (rawData[byteIndex + 2] * 1.0) / 255.0;
	CGFloat alpha = (rawData[byteIndex + 3] * 1.0) / 255.0;

	UIColor *result = nil;
	result = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
	free(rawData);
	return result;
}



- (UIColor *)colorAtPixel:(CGPoint)point
{
	// Cancel if point is outside image coordinates
	if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), point)) {
		return nil;
	}

	// Create a 1x1 pixel byte array and bitmap context to draw the pixel into.
	// Reference: http://stackoverflow.com/questions/1042830/retrieving-a-pixel-alpha-value-for-a-uiimage
	NSInteger pointX = trunc(point.x);
	NSInteger pointY = trunc(point.y);
	CGImageRef cgImage = self.CGImage;
	NSUInteger width = self.size.width;
	NSUInteger height = self.size.height;
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	int bytesPerPixel = 4;
	int bytesPerRow = bytesPerPixel * 1;
	NSUInteger bitsPerComponent = 8;
	unsigned char pixelData[4] = { 0, 0, 0, 0 };
	CGContextRef context = CGBitmapContextCreate(pixelData,
												 1,
												 1,
												 bitsPerComponent,
												 bytesPerRow,
												 colorSpace,
												 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
	CGColorSpaceRelease(colorSpace);
	CGContextSetBlendMode(context, kCGBlendModeCopy);

	// Draw the pixel we are interested in onto the bitmap context
	CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
	CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
	CGContextRelease(context);

	// Convert color values [0..255] to floats [0.0..1.0]
	CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
	CGFloat green = (CGFloat)pixelData[1] / 255.0f;
	CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
	CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
	return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


- (BOOL)hasAlphaChannel
{
	CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage);
	return (alpha == kCGImageAlphaFirst ||
			alpha == kCGImageAlphaLast ||
			alpha == kCGImageAlphaPremultipliedFirst ||
			alpha == kCGImageAlphaPremultipliedLast);
}

/**
 * 拉伸图片的部份
 */
-(UIImage *)TensileImage:(UIEdgeInsets)insets
{
	return [self resizableImageWithCapInsets:insets];
}





@end
