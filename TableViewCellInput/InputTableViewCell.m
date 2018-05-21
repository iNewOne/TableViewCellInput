//
//  InputTableViewCell.m
//  TableViewCellInput
//
//  Created by Xujiangfei on 2018/5/21.
//  Copyright © 2018年 Xujiangfei. All rights reserved.
//

#import "InputTableViewCell.h"
#import "Masonry.h"

@implementation InputTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.indexLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.indexLabel];
        
        self.nameTF = [[UITextField alloc]init];
        self.nameTF.borderStyle = UITextBorderStyleRoundedRect;
        [self.contentView addSubview:self.nameTF];
        
        self.priceTF = [[UITextField alloc]init];
        self.priceTF.borderStyle = UITextBorderStyleRoundedRect;
        [self.contentView addSubview:self.priceTF];
        
        [self.indexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self.contentView).offset(0);
            make.width.equalTo(@30);
        }];
        
        [self.nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.indexLabel.mas_right).offset(8);
            make.top.equalTo(self.contentView).offset(8);
            make.right.equalTo(self.contentView).offset(-8);
            make.bottom.equalTo(self.priceTF.mas_top).offset(-8);
            make.height.equalTo(self.priceTF.mas_height);
        }];
        
        [self.priceTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.indexLabel.mas_right).offset(8);
            make.right.bottom.equalTo(self.contentView).offset(-8);
        }];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
