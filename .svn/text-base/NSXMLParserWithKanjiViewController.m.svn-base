//
//  NSXMLParserWithKanjiViewController.m
//  MyDemoList
//
//  Created by Zhu Shouyu on 1/15/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "NSXMLParserWithKanjiViewController.h"

@interface NSXMLParserWithKanjiViewController ()
@property (nonatomic, retain) NSMutableArray *allResourcesValues;
@property (nonatomic, copy) NSMutableString *partherString;
@end

@implementation NSXMLParserWithKanjiViewController
@synthesize allResourcesValues = _allResourcesValues;
@synthesize partherString = _partherString;

- (void)dealloc
{
    self.allResourcesValues = nil;
    self.partherString = nil;
    [super dealloc];
}

+ (void)load
{
    @autoreleasepool {
        [super regsterSelf:self];
    }
    
}

- (id)init
{
    if (self = [super init])
    {
        @autoreleasepool {
            self.mainTitle = [NSString stringWithFormat:@"%@", @"XML解析"];
            self.descriptionTitle = [NSString stringWithFormat:@"%@", @"对于节点包含汉字的，解析要尤其注意，会出现自动换行"];
            _allResourcesValues = [[NSMutableArray alloc] init];
        }
    }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    [tableView release];
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MyTest" ofType:@"xml"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:fileURL];
    [parser setDelegate:self];
    [parser parse];
//    [parser release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDatasource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.allResourcesValues count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    }
    cell.textLabel.text = [self.allResourcesValues objectAtIndex:indexPath.row];
    return cell;
}

#pragma NSXMLParserDelegate
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
{
    if (nil != self.partherString)
    {
        [self.allResourcesValues addObject:self.partherString];
        NSLog(@"------%@", self.partherString);
        [_partherString release];
        _partherString = nil;
    }
    _partherString = [[NSMutableString alloc] init];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [self.partherString appendString:string];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    for (UIView *tempView in self.view.subviews)
    {
        if ([tempView isKindOfClass:[UITableView class]])
        {
            [(UITableView *)tempView reloadData];
            break;
        }
    }
}
@end
