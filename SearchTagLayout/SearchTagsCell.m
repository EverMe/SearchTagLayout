//
//  SearchTagsCell.m
//  suiyue
//
//  Created by 鲍业伟 on 16/10/10.
//  Copyright © 2016年 SuiYue. All rights reserved.
//

#import "SearchTagsCell.h"

CGFloat heightForCell = 40;

@interface SearchTagsCell ()

@property (weak, nonatomic) IBOutlet UILabel *keywordsLab;
@end

@implementation SearchTagsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.cornerRadius = self.bounds.size.height / 2;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5].CGColor;//[UIColor whiteColor].CGColor;
    self.layer.borderWidth = 1.0;
    
}

- (void)setKeyword:(NSString *)keyword {
    _keyword = keyword;
    _keywordsLab.text = _keyword;
    
    [self layoutIfNeeded];
    [self updateConstraintsIfNeeded];
}

- (CGSize)sizeForCell {
    //宽度加 heightForCell 为了两边圆角。
    return CGSizeMake([_keywordsLab sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)].width + heightForCell, heightForCell);
}

@end
