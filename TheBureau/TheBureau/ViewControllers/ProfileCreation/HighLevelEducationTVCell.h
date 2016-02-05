//
//  HighLevelEducationTVCell.h
//  SampleUI
//
//  Created by Sarath Neeravallil Sasi on 04/02/16.
//  Copyright © 2016 Sarath Neeravallil Sasi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HighLevelEducationTVCellDelegate <NSObject>

-(void)addNextLevelButtonTapped;
- (void)updateHighLevelEducationTVCell;


@end

@interface HighLevelEducationTVCell : UITableViewCell

@property (nonatomic,assign) id <HighLevelEducationTVCellDelegate> delegate;

@end
