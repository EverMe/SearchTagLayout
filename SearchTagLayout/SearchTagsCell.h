//
//  SearchTagsCell.h
//  suiyue
//
//  Created by 鲍业伟 on 16/10/10.
//  Copyright © 2016年 SuiYue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTagsCell : UICollectionViewCell

@property (nonatomic, copy) NSString *keyword;
- (CGSize)sizeForCell; 
@end
