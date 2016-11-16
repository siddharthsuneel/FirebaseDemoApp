//
//  HomeViewController.m
//  FirebaseDemoApp
//
//  Created by Siddharth Suneel on 11/11/16.
//  Copyright © 2016 SiddharthSuneel. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    
}

@property (strong, nonatomic) UITableView *remainderList;
@property (strong, nonatomic) UIButton *addButton;

@end

static NSString *cellIdentifier = @"CellIdentifier";

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _currentloggedInUser.email;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setup];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    _remainderList.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height - 100.0);
    
    _addButton.frame = CGRectMake((self.view.frame.size.width - 30.0)/2, (CGRectGetMaxY(_remainderList.frame) + 30.0), 30.0, 30.0);
    _addButton.layer.cornerRadius = 30.0/2;
//    _addButton.layer.borderColor = [UIColor blackColor].CGColor;
//    _addButton.layer.borderWidth = 0.5;
    _addButton.clipsToBounds = YES;

}

- (void)setup{
    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleDone target:self action:@selector(didClickedLogout:)];
    self.navigationItem.leftBarButtonItem = logoutButton;
    
//    [self.navigationItem.leftBarButtonItem setTitle:@"Logout"];
//    [self.navigationItem.leftBarButtonItem setTarget:self];
//    [self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStyleDone];
//    [self.navigationItem.leftBarButtonItem setAction:@selector(didClickedLogout:)];
    
    self.ref = [[FIRDatabase database] reference];
    [self readDataFromDB];
    
    _remainderList = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _remainderList.delegate = self;
    _remainderList.dataSource = self;
    [self.view addSubview:_remainderList];
    
    _addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _addButton.frame = CGRectZero;
    _addButton.backgroundColor = [UIColor lightGrayColor];
    [_addButton setBackgroundImage:[UIImage imageNamed:@"addIcon"] forState:UIControlStateNormal];
    [_addButton addTarget:self action:@selector(didClickedOnAddButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_addButton];
}

- (void)readDataFromDB{
    NSString *userId = [FIRAuth auth].currentUser.uid;
    [[[_ref child:@"user"] child:userId] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
    } withCancelBlock:^(NSError * _Nonnull error) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

- (void)didClickedLogout:(id)sender{
    NSError *error;
    [[FIRAuth auth] signOut:&error];
    if (!error) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)didClickedOnAddButton:(id)sender{
    
}

@end
