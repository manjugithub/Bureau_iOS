
//
//  BUProfileHeritageVC.m
//  TheBureau
//
//  Created by Manjunath on 25/01/16.
//  Copyright © 2016 Bureau. All rights reserved.
//

#import "BUProfileHeritageVC.h"
#import "BUProfileOccupationVC.h"
@interface BUProfileHeritageVC ()
@property(nonatomic, strong) PWCustomPickerView *customPickerView;
@property(nonatomic, strong) NSString *religionID,*famliyID,*specificationID;

@property(nonatomic, strong) IBOutlet UITextField *religionTF,*motherToungueTF,*specificationTF,*gothraTF,*familyOriginTF;

@property(nonatomic) eHeritageList heritageList;
@end

@implementation BUProfileHeritageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Heritage";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



-(IBAction)getReligion:(id)sender
{
    NSDictionary *parameters = nil;
    [self startActivityIndicator:YES];
    self.heritageList = eReligionList;
    [[BUWebServicesManager sharedManager] getReligionList:self parameters:parameters];
}


-(IBAction)getMotherToungue:(id)sender
{
    
}

-(IBAction)getSpecificationList:(id)sender
{
    self.heritageList = eSpecificationList;
    NSDictionary *parameters = nil;
    parameters = @{@"family_origin_id": self.famliyID};
    [self startActivityIndicator:YES];
    [[BUWebServicesManager sharedManager] getSpecificationList:self parameters:parameters];
}

-(IBAction)getFamilyOrigin:(id)sender
{
    self.heritageList = eFamilyOriginList;
    NSDictionary *parameters = nil;
    parameters = @{@"religion_id": self.religionID};
    [self startActivityIndicator:YES];
    [[BUWebServicesManager sharedManager] getFamilyOriginList:self parameters:parameters];
}

-(IBAction)continueClicked:(id)sender
{
    UIStoryboard *sb =[UIStoryboard storyboardWithName:@"ProfileCreation" bundle:nil];
    BUProfileOccupationVC *vc = [sb instantiateViewControllerWithIdentifier:@"BUProfileOccupationVC"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)didSuccess:(id)inResult
{
    [self stopActivityIndicator];

    UIStoryboard *sb =[UIStoryboard storyboardWithName:@"CustomPicker" bundle:nil];
    self.customPickerView = [sb instantiateViewControllerWithIdentifier:@"PWCustomPickerView"];
    
    self.customPickerView.pickerDataSource = inResult;
    self.customPickerView.selectedHeritage = self.heritageList;
    [self.customPickerView showCusptomPickeWithDelegate:self];
    self.customPickerView.titleLabel.text = @"Physical Activity";
}

-(void)didFail:(id)inResult
{
    
}

- (void)didItemSelected:(NSMutableDictionary *)inSelectedRow
{
    switch (self.heritageList)
    {
        case eReligionList:
        {
            self.religionTF.text = [inSelectedRow valueForKey:@"religion_name"];
            self.religionID = [inSelectedRow valueForKey:@"religion_id"];
            break;
        }
        case eMotherToungueList:
        {
            
            break;
        }
        case eFamilyOriginList:
        {
            
            self.familyOriginTF.text = [inSelectedRow valueForKey:@"family_origin_name"];
            self.famliyID = [inSelectedRow valueForKey:@"family_origin_id"];
            break;
        }
        case eSpecificationList:
        {
            self.specificationTF.text = [inSelectedRow valueForKey:@"specification_name"];
            self.specificationID = [inSelectedRow valueForKey:@"specification_id"];
            break;
        }
        case eGothraList:
        {
            
            break;
        }
            
        default:
            break;
    }
}
@end
