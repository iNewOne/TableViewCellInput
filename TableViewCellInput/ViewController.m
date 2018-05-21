//
//  ViewController.m
//  TableViewCellInput
//
//  Created by Xujiangfei on 2018/5/21.
//  Copyright © 2018年 Xujiangfei. All rights reserved.
//

#import "ViewController.h"
#import "InputTableViewCell.h"
#import "RoomModel.h"

static NSString *identifier = @"cell";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTB;

@property (nonatomic, strong) NSMutableArray *rooms;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTB.rowHeight = 200;
    
    self.rooms = [[NSMutableArray alloc]init];
    
    for (NSInteger i = 0; i < 30; i++) {
        RoomModel *model = [[RoomModel alloc]init];
        model.name = @"";
        model.price = @"";
        [self.rooms addObject:model];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}


- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath{
    RoomModel *model = self.rooms[indexPath.row];
    
    InputTableViewCell *inputCell = (InputTableViewCell *)cell;
    
    model.name = inputCell.nameTF.text;
    model.price = inputCell.priceTF.text;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    InputTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[InputTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.indexLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row + 1];
    
    RoomModel *model = self.rooms[indexPath.row];
    cell.nameTF.text = model.name;
    cell.priceTF.text = model.price;
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
