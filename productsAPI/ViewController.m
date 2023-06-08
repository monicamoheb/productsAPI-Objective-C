//
//  ViewController.m
//  productsAPI
//
//  Created by Mac on 24/04/2023.
//

#import "ViewController.h"
#import "DetailsViewController.h"

@interface ViewController (){
    NSMutableArray <Product *> *productArr;
}
@property NSURL *url;
@property NSURLRequest *req;
@property NSURLConnection *conn;
@property NSMutableData *myData;
@property NSString *urlstring;
@property NSMutableDictionary *productList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    productArr=[NSMutableArray new];
    _productList=[NSMutableDictionary new];
    _myData=[NSMutableData new];
    
    _urlstring=@"https://dummyjson.com/products";
    _url=[NSURL URLWithString:_urlstring];
    _req=[NSURLRequest requestWithURL:_url];
    _conn=[[NSURLConnection alloc] initWithRequest:_req delegate:self];
    [_conn start];
    // Do any additional setup after loading the view.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=[[productArr objectAtIndex:indexPath.row] valueForKey:@"title"];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return productArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_myData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    _productList=[NSJSONSerialization JSONObjectWithData:_myData options:NSJSONReadingAllowFragments error:nil];
    productArr=[_productList mutableArrayValueForKey:@"products"];

    [self.tableView reloadData];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailsViewController *sec=[self.storyboard instantiateViewControllerWithIdentifier:@"details"];
    sec.pTitle=[[productArr objectAtIndex:indexPath.row] valueForKey:@"title"];
    sec.pPrice=[[[productArr objectAtIndex:indexPath.row] valueForKey:@"price"] intValue];
    sec.rating=[[[productArr objectAtIndex:indexPath.row] valueForKey:@"rating"] doubleValue];
    sec.pthumbnail=[[productArr objectAtIndex:indexPath.row] valueForKey:@"thumbnail"];
    [self.navigationController pushViewController:sec animated:YES];
}

@end
