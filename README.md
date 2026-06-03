# Doctor Registration App

A complete production-ready iOS healthcare application built with **Swift 5, UIKit, Storyboard, and URLSession**.

## ✨ Features

✅ **Doctor Registration** with comprehensive form validation  
✅ **Doctors List** with pull-to-refresh functionality  
✅ **Doctor Details** view with full information display  
✅ **Healthcare Dashboard** with quick action cards  
✅ **Professional UI** with modern card design and animations  
✅ **Responsive Layout** supporting iPhone 13, 14, 15, 16  
✅ **Error Handling** with user-friendly alerts  
✅ **Loading States** with spinners and empty states  

## 🏗️ Architecture

- **MVC Pattern** (Model-View-Controller)
- **URLSession** for networking
- **Auto Layout** for responsive design
- **Storyboard** for UI management
- **Clean Code** with proper separation of concerns

## 📋 Requirements

- Xcode 16+
- iOS 13.0+
- Swift 5.0+
- No third-party libraries

## 🚀 Installation

### Step 1: Clone Repository
```bash
git clone https://github.com/saranshxx/doctor-appointment-app.git
cd doctor-appointment-app
```

### Step 2: Open Project
```bash
open DoctorRegistrationApp/DoctorRegistrationApp.xcodeproj
```

### Step 3: Build & Run
- Select target: `DoctorRegistrationApp`
- Select simulator: iPhone 15 (or your preferred device)
- Press `Cmd + R` to build and run

## 📱 App Flow

```
Registration Screen → Doctors List Screen → Doctor Details Screen → Dashboard Screen
```

### Screen 1: Registration
- Step indicator (2/4)
- Full name input
- Email input with validation
- Gender selection (Male/Female/Others)
- Month & Year pickers
- API call to register doctor
- Loading spinner

### Screen 2: Doctors List
- UITableView with custom cells
- Pull-to-refresh
- Loading indicator
- Empty state
- Error handling
- Tap to view details

### Screen 3: Doctor Details
- Display all doctor information
- Name, Email, Gender
- Phone, Age, Practicing date
- GUID reference
- Button to open dashboard

### Screen 4: Dashboard
- Doctor greeting
- Search bar
- Health banner
- UICollectionView with action cards
- 6 quick action tiles (Scan, Vaccine, Bookings, Clinic, Ambulance, Nurse)

## 🔌 API Endpoints

### Register Doctor (POST)
```
URL: http://199.192.26.248:8000/sap/opu/odata/sap/ZCDS_C_TEST_REGISTER_NEW_CDS/ZCDS_C_TEST_REGISTER_NEW

Payload:
{
  "Name": "John Doe",
  "NameUpper": "JOHN DOE",
  "Email": "john@example.com",
  "Gender": "M",
  "PhoneNo": "9876543210",
  "WhatsappNo": "9876543210",
  "CountryCode": "IN",
  "Age": "30",
  "AgeUnit": "Y"
}
```

### Get All Doctors (GET)
```
URL: http://199.192.26.248:8000/sap/opu/odata/sap/ZCDS_C_TEST_REGISTER_NEW_CDS/ZCDS_C_TEST_REGISTER_NEW
```

### Get Doctor Details (GET)
```
URL: http://199.192.26.248:8000/sap/opu/odata/sap/ZCDS_C_TEST_REGISTER_NEW_CDS/ZCDS_C_TEST_REGISTER_NEW(guid'{doctorGUID}')
```

## 📂 Project Structure

```
DoctorRegistrationApp/
├── Network/
│   ├── APIManager.swift           # Network requests
│   └── NetworkError.swift         # Error handling
├── Models/
│   ├── Doctor.swift               # Doctor model
│   ├── RegisterRequest.swift       # Registration payload
│   └── RegisterResponse.swift      # Registration response
├── Controllers/
│   ├── RegistrationViewController.swift   # Registration screen
│   ├── DoctorsListViewController.swift    # Doctors list
│   ├── DoctorDetailsViewController.swift  # Doctor details
│   └── DashboardViewController.swift      # Dashboard
├── Views/
│   ├── DoctorCell.swift           # Custom table cell
│   └── DashboardActionCell.swift  # Custom collection cell
├── AppDelegate.swift              # App configuration
└── Main.storyboard                # UI layout
```

## 🎨 UI Components

### Custom Cells
- **DoctorCell**: Displays doctor information with card design
- **DashboardActionCell**: Shows action tiles with icons

### UIElements
- UINavigationController for navigation
- UITableView for lists
- UICollectionView for grid layout
- UIPickerView for month/year selection
- UISearchBar for search functionality
- UIActivityIndicatorView for loading
- UIRefreshControl for pull-to-refresh

## ✅ Validation

- ✓ Name field required
- ✓ Email field required
- ✓ Valid email format (regex)
- ✓ Gender selection required
- ✓ Month/Year selection

## 🔐 Error Handling

- Network errors with detailed messages
- Validation errors with user alerts
- API errors with status codes
- Decoding errors with fallback
- Empty state handling

## 📊 Network Layer

### APIManager
- Singleton pattern for shared instance
- URLSession configuration with 30s timeout
- Result-based completion handlers
- Proper error propagation
- Main thread dispatch for UI updates

### NetworkError Enum
- Custom error types
- LocalizedError compliance
- Descriptive error messages

## 🎯 Key Features Implementation

### Form Validation
```swift
- Name validation (non-empty)
- Email validation (regex pattern)
- Gender selection (M/F/O)
- Month/Year picker data
```

### API Integration
```swift
- Register doctor with payload
- Fetch all doctors list
- Get doctor by GUID
- Handle Codable models
```

### UI/UX
```swift
- Loading spinners during requests
- Pull-to-refresh on list
- Empty state messages
- Error alerts
- Card-based design
- Responsive layouts
```

## 🚀 Performance

- Efficient tableView cell reuse
- Lazy loading with pickers
- Minimal memory footprint
- No blocking operations
- Smooth animations

## 📝 Coding Standards

- Clean Swift code with MARK comments
- Proper delegate/datasource patterns
- Type-safe Codable models
- Error handling best practices
- Memory leak prevention with weak self
- Auto Layout constraints

## 🐛 Testing

1. **Registration Flow**:
   - Test validation messages
   - Test API registration
   - Test navigation

2. **Doctors List**:
   - Test data loading
   - Test refresh functionality
   - Test empty state

3. **Doctor Details**:
   - Test API fetch by GUID
   - Test UI population
   - Test navigation to dashboard

4. **Dashboard**:
   - Test greeting display
   - Test collection view layout
   - Test responsive design

## 📲 Device Compatibility

✅ iPhone 13  
✅ iPhone 14  
✅ iPhone 15  
✅ iPhone 16  
✅ iPad (with adjustments)

## 🎓 Learning Points

This app demonstrates:
- Swift fundamentals
- UIKit components
- Networking with URLSession
- MVC architecture
- Auto Layout
- Data models with Codable
- Error handling
- Navigation patterns
- Delegates & datasources

## 👨‍💻 Author

Saransh Patel  
GitHub: [@saranshxx](https://github.com/saranshxx)

## 📄 License

MIT License - Feel free to use for personal or commercial projects

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

**Happy Coding! 🎉**
