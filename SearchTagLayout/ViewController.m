//
//  ViewController.m
//  SearchTagLayout
//
//  Created by 鲍业伟 on 16/11/3.
//  Copyright © 2016年 鲍业伟. All rights reserved.
//

#import "ViewController.h"
#import "HotTagFlowLayout.h"
#import "SearchTagsCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *mCollectionViwe;
@property (weak, nonatomic) IBOutlet HotTagFlowLayout *mLayout;

@property (strong, nonatomic) SearchTagsCell *tagCell;  //只为计算高度
@property (strong, nonatomic) NSMutableArray *dataArr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initUI];
}

- (void)initUI{
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.mLayout.minimumLineSpacing = 10;
    self.mLayout.minimumInteritemSpacing = 10;
    self.mLayout.sectionInset = UIEdgeInsetsMake(40, 0, 0, 0);
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 20)];
    titleLab.text = @"大家都在搜";
    titleLab.textColor = [UIColor redColor];
    titleLab.font = [UIFont boldSystemFontOfSize:20];
    titleLab.textAlignment = NSTextAlignmentLeft;
    [self.mCollectionViwe addSubview:titleLab];
    
    [self.mCollectionViwe registerNib:[UINib nibWithNibName:@"SearchTagsCell" bundle:nil] forCellWithReuseIdentifier:@"SearchTagsCell"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SearchTagsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SearchTagsCell" forIndexPath:indexPath];
    cell.keyword = self.dataArr[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_tagCell == nil) {
        _tagCell = [[NSBundle mainBundle] loadNibNamed:@"SearchTagsCell" owner:nil options:nil].firstObject;
    }
    _tagCell.keyword = self.dataArr[indexPath.row];
    return [_tagCell sizeForCell];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *keywords = self.dataArr[indexPath.row];
    NSLog(@"didSelectItemAtIndexPath---%@",keywords);
    
}

#pragma mark --懒加载

- (NSMutableArray *)dataArr{
    
    if (!_dataArr) {
#warning TestData
        _dataArr = [NSMutableArray arrayWithArray:@[@"测试数据",@"云标签",@"历史记录",@"测试",@"妈妈说标题要长",@"机智标题要长标题要长"]];
    }
    return _dataArr;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
