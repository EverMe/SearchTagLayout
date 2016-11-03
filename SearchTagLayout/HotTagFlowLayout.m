//
//  HotTagFlowLayout.m
//  TestCollectionLayout
//
//  Created by 鲍业伟 on 16/10/11.
//  Copyright © 2016年 鲍业伟. All rights reserved.
//

#import "HotTagFlowLayout.h"

@implementation HotTagFlowLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    for(int i = 1; i < [attributes count]; ++i) {
        //当前attributes
        UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];
        //上一个attributes
        UICollectionViewLayoutAttributes *prevLayoutAttributes = attributes[i - 1];
        //我们想设置的最大间距，可根据需要改
        CGFloat maximumSpacing = self.minimumInteritemSpacing;
        //前一个cell的最右边
        CGFloat origin = CGRectGetMaxX(prevLayoutAttributes.frame);
        //如果当前一个cell的最右边加上我们想要的间距加上当前cell的宽度依然在contentSize中，我们改变当前cell的原点位置
        //不加这个判断的后果是，UICollectionView只显示一行，原因是下面所有cell的x值都被加到第一行最后一个元素的后面了
        if(origin + maximumSpacing + currentLayoutAttributes.frame.size.width <= self.collectionViewContentSize.width) {
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = origin + maximumSpacing;
            currentLayoutAttributes.frame = frame;
        }else{
            //不在同一行把 第一个置顶
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = 0;
            currentLayoutAttributes.frame = frame;
            
            //当前第二个置顶时  把第一个也置顶
            if (i == 1) {
                CGRect frame = prevLayoutAttributes.frame;
                frame.origin.x = 0;
                prevLayoutAttributes.frame = frame;
            }
        }
    }
    //只有一个时第一个置顶
    if (attributes.count == 1) {
        UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[0];
        CGRect frame = currentLayoutAttributes.frame;
        frame.origin.x = 0;
        currentLayoutAttributes.frame = frame;
    }
    
    return attributes;
}


@end
