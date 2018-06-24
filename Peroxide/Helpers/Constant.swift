//  Constant.swift

//This class belongs to contain all hardcode strings.
//We will use define key in entire application for conctant values.


import UIKit

//Network Related Error
let SERVER_COULD_NOT_FOUND     =        -1003
let CONNECTION_LOST            =        -1005
let INTERNET_OFFLINE           =        -1009

//Messages & Titles
let kAppName                   =         "AppName"
let kOkButton                  =         "OK"

//Api Endpoints
let kBaseUrl   = "https://jsonplaceholder.typicode.com/posts"

//Regular Expresions
let kRegexEmailValidate = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
let kRegexCharacterSet = "ABCDEFGHIJKLMONPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz  "

//Color Codes
let colorMintGreen = UIColor(red: 30/255, green: 166/255, blue: 100/255, alpha: 1.0)
let colorRed = UIColor(red: 237/255, green: 28/255, blue: 35/255, alpha: 1.0)

//Images
let imageHeaderiPad = "HeaderiPad"
let imageHeaderiPhone = "Header"

//Font Family
let kFontHalvetica = "Halvetica"
let kFontRobotoThin = "Roboto-Thin"
let fontArialMT = "Arial-MT"
let kFontLatoBold = "Lato-Bold"
let kFontHelveticaNeue = "HelveticaNeue"
let kFontRobotoRegular = "Roboto-Regular"
let kFontUbuntuRegular = "Ubuntu-Regular"

//Button Titles
let titleTvShowSeason = "TV Show Season"

//Storyboards & ViewControllers
let kMain = "Main"
let kViewController =  "ViewController"


//JSON Responce Keys
let kChannelStreams = "channelStreams"


//Alert Messages
let kNetworkError = "Network error.Please check your network connection."
let kBothFieldEmptyMessage = "Please enter btoh details."
let kUserFieldEmptyMessage = "Please enter username."
let kPasswordFieldEmptyMessage = "Please enter password."
let kRepeatPasswordFieldEmptyMessage = "Please enter repeat password."
let kEmailFieldEmptyMessage = "Please enter email."



let kIsLoggedIn = "isLogin"
let kRemoveFromSuperView = "RemoveFromSuperView"

//UITableViewCell
let kCellIdentifier = "CellIdentifier"
let kSliderTableViewCell = "SliderTableViewCell"
let kProfessionalInfoTableViewCell = "ProfessionalInfoTableViewCell"
let kManagerInfoTableViewCell = "ManagerInfoTableViewCell"
let kResourcesTableViewCell = "ResourcesTableViewCell"
let kSearchEmployeeTableViewCell = "SearchEmployeeTableViewCell"
let kAttendanceTableViewCell = "AttendanceTableViewCell"
let kHolidaysTableViewCell = "HolidaysTableViewCell"
let kLeavesTableViewCell = "LeavesTableViewCell"
let kUpComingLeavesTableViewCell = "UpComingLeavesTableViewCell"
let kRecentLeavesTableViewCell = "RecentLeavesTableViewCell"
let kFoodMenuTableViewCell = "FoodMenuTableViewCell"
let kRemainingLeavesTableViewCell = "RemainingLeavesTableViewCell"
let kSalarySlipTableViewCell = "SalarySlipTableViewCell"
class Constant: NSObject {
    
}
