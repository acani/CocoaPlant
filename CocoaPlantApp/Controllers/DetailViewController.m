#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailItem;
@synthesize detailDescriptionLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", nil);
    }
    return self;
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (detailItem != newDetailItem) {
        detailItem = newDetailItem;

        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    if (self.detailItem) {
        detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.detailDescriptionLabel = [[UILabel alloc] initWithFrame:
                                   CGRectMake(20.0f, 221.0f, 280.0f, 18.0f)];
    detailDescriptionLabel.textAlignment = UITextAlignmentCenter;
    detailDescriptionLabel.adjustsFontSizeToFitWidth = YES;
    detailDescriptionLabel.minimumFontSize = 10.0f;
    [self.view addSubview:detailDescriptionLabel];
    [self configureView];
}

- (void)viewDidUnload
{
    self.detailDescriptionLabel = nil;
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
