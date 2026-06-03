# Storyboard Setup Guide - Doctor Registration App

## 📋 Complete Step-by-Step Instructions

Follow these detailed steps to set up the complete storyboard with all UI elements and connections.

---

## STEP 1: Create New Storyboard File

1. Open your Xcode project
2. **File → New → File** (Cmd + N)
3. Select **Storyboard**
4. Name it `Main`
5. Select **DoctorRegistrationApp** as target
6. Click **Create**

---

## STEP 2: Set as Initial Storyboard

1. Select `DoctorRegistrationApp` project file
2. Select **DoctorRegistrationApp** target
3. Go to **Info** tab
4. Under **Custom iOS Target Properties**, find **Storyboard Name**
5. Set value to `Main`

---

## STEP 3: Create Root Navigation Controller

1. Open **Main.storyboard**
2. **Object Library** → Search "Navigation Controller"
3. Drag **Navigation Controller** to canvas
4. Select the Navigation Controller
5. Go to **Attributes Inspector** (⌘⌥4)
6. Check **Is Initial View Controller**

---

## STEP 4: Setup Registration Screen

### 4.1 Create ViewController

1. Delete the default ViewController (if any)
2. **Object Library** → Drag **UIViewController** to canvas
3. Select the new ViewController
4. **Identity Inspector** (⌘⌥3)
5. Set **Class** to `RegistrationViewController`
6. Set **Storyboard ID** to `RegistrationViewController`
7. Connect Navigation Controller to this VC:
   - Control-drag from Navigation Controller to RegistrationViewController
   - Select "root view controller"

### 4.2 Add UI Components

**Add these views to the ViewController in this order:**

#### ScrollView (Optional but recommended)
- **Object Library** → Drag **ScrollView**
- Pin to Safe Area (top, left, right, bottom) with 0 padding

#### Progress Label
- **Object Library** → Drag **Label**
- Set text: "Step 2/4"
- Position: Top-left area
- Font: System, 14pt, Semibold
- Create IBOutlet: `progressLabel`

#### Title Label
- **Object Library** → Drag **Label**
- Set text: "Basic Details"
- Position: Below progress label
- Font: System, 28pt, Bold
- Create IBOutlet: `titleLabel`

#### Subtitle Label
- **Object Library** → Drag **Label**
- Set text: "Feel free to fill your details"
- Position: Below title
- Font: System, 16pt, Regular
- Text Color: Gray
- Create IBOutlet: `subtitleLabel`

#### Full Name TextField
- **Object Library** → Drag **Text Field**
- Set placeholder: "Full Name"
- Border Style: Rounded Rectangle
- Position: Below subtitle
- Create IBOutlet: `fullNameTextField`

#### Email TextField
- **Object Library** → Drag **Text Field**
- Set placeholder: "Email ID"
- Border Style: Rounded Rectangle
- Position: Below Full Name
- Create IBOutlet: `emailTextField`

#### Gender Label
- **Object Library** → Drag **Label**
- Set text: "Gender"
- Font: System, 16pt, Semibold

#### Male Button
- **Object Library** → Drag **Button**
- Set text: "Male"
- Border Style: Rounded Rectangle
- Create IBOutlet: `maleButton`
- Create IBAction: `selectMale`

#### Female Button
- **Object Library** → Drag **Button**
- Set text: "Female"
- Border Style: Rounded Rectangle
- Create IBOutlet: `femaleButton`
- Create IBAction: `selectFemale`

#### Others Button
- **Object Library** → Drag **Button**
- Set text: "Others"
- Border Style: Rounded Rectangle
- Create IBOutlet: `othersButton`
- Create IBAction: `selectOthers`

#### Month Picker
- **Object Library** → Drag **Picker View**
- Height: 150pt
- Create IBOutlet: `monthPicker`

#### Year Picker
- **Object Library** → Drag **Picker View**
- Height: 150pt
- Create IBOutlet: `yearPicker`

#### Next Button
- **Object Library** → Drag **Button**
- Set text: Empty (icon only)
- Add System Image: "arrow.right"
- Make circular (Width = Height)
- Background Color: Blue (#0078F0)
- Position: Bottom-right
- Create IBOutlet: `nextButton`
- Create IBAction: `nextButtonTapped`

#### Loading Spinner
- **Object Library** → Drag **Activity Indicator View**
- Style: Medium (Gray)
- Center in view
- Hidden by default
- Create IBOutlet: `loadingSpinner`

---

## STEP 5: Setup Doctors List Screen

### 5.1 Create ViewController

1. **Object Library** → Drag **UIViewController**
2. **Identity Inspector**:
   - Class: `DoctorsListViewController`
   - Storyboard ID: `DoctorsListViewController`

### 5.2 Add UI Components

#### TableView
- **Object Library** → Drag **TableView**
- Pin to Safe Area
- Create IBOutlet: `tableView`

#### Loading Spinner
- **Object Library** → Drag **Activity Indicator View**
- Center in view
- Create IBOutlet: `loadingSpinner`

#### Empty State Label
- **Object Library** → Drag **Label**
- Set text: "No doctors found"
- Center in view
- Hidden by default
- Create IBOutlet: `emptyStateLabel`

### 5.3 Register TableView Cell

The cell is registered programmatically in code, but you can also create a custom cell in IB:

1. Right-click on TableView
2. Under "Outlets", drag to your ViewController
3. Select "dataSource"
4. Repeat for "delegate"

---

## STEP 6: Setup Doctor Details Screen

### 6.1 Create ViewController

1. **Object Library** → Drag **UIViewController**
2. **Identity Inspector**:
   - Class: `DoctorDetailsViewController`
   - Storyboard ID: `DoctorDetailsViewController`

### 6.2 Add UI Components

#### ScrollView (Optional)
- Pin to Safe Area
- Add all labels inside

#### Name Label
- **Object Library** → Drag **Label**
- Font: 16pt
- Create IBOutlet: `nameLabel`

#### Email Label
- Font: 16pt
- Create IBOutlet: `emailLabel`

#### Gender Label
- Font: 16pt
- Create IBOutlet: `genderLabel`

#### Phone Label
- Font: 16pt
- Create IBOutlet: `phoneLabel`

#### Age Label
- Font: 16pt
- Create IBOutlet: `ageLabel`

#### Practicing Label
- Font: 16pt
- Create IBOutlet: `practicingLabel`

#### GUID Label
- Font: 16pt
- Create IBOutlet: `guidLabel`

#### Dashboard Button
- Set text: "Open Dashboard"
- Background Color: Blue
- Title Color: White
- Create IBOutlet: `dashboardButton`
- Create IBAction: `openDashboard`

#### Loading Spinner
- Center in view
- Create IBOutlet: `loadingSpinner`

---

## STEP 7: Setup Dashboard Screen

### 7.1 Create ViewController

1. **Object Library** → Drag **UIViewController**
2. **Identity Inspector**:
   - Class: `DashboardViewController`
   - Storyboard ID: `DashboardViewController`

### 7.2 Add UI Components

#### Greeting Label
- **Object Library** → Drag **Label**
- Set text: "Hello,\nDr. [Name]"
- Font: 28pt, Bold
- Lines: 2
- Create IBOutlet: `greetingLabel`

#### Search Bar
- **Object Library** → Drag **Search Bar**
- Set placeholder: "Search health services"
- Create IBOutlet: `searchBar`

#### Health Banner View
- **Object Library** → Drag **View**
- Background Color: Blue (#0078F0)
- Corner Radius: 12pt
- Height: 80pt
- Create IBOutlet: `healthBannerView`

#### Health Banner Label
- **Object Library** → Drag **Label** inside banner
- Set text: "📋 Complete your health checkup..."
- Font: 14pt, Semibold
- Text Color: White
- Lines: 2
- Create IBOutlet: `healthBannerLabel`

#### Collection View
- **Object Library** → Drag **Collection View**
- Pin to bottom of banner
- Scroll Direction: Vertical
- Minimum Spacing: 12pt
- Create IBOutlet: `collectionView`

---

## STEP 8: Create Segues

### 8.1 Registration → Doctors List

1. Control-drag from **RegistrationViewController** to **DoctorsListViewController**
2. Select **Show** segue
3. Select the segue line
4. **Attributes Inspector**:
   - Identifier: `showDoctorsList`

### 8.2 Doctors List → Doctor Details

1. Control-drag from **DoctorsListViewController** to **DoctorDetailsViewController**
2. Select **Show** segue
3. **Attributes Inspector**:
   - Identifier: `showDoctorDetails`

### 8.3 Doctor Details → Dashboard

1. Control-drag from **Dashboard Button** to **DashboardViewController**
2. Select **Show** segue
3. (Optional) Set identifier if needed

---

## STEP 9: Add Auto Layout Constraints

For each screen, add these constraints:

### Registration Screen

**Progress Label:**
- Top: 20pt from Safe Area
- Left: 16pt from Safe Area

**Title Label:**
- Top: 12pt from Progress
- Left: 16pt
- Right: 16pt

**Subtitle Label:**
- Top: 8pt from Title
- Left: 16pt
- Right: 16pt

**Full Name TextField:**
- Top: 20pt from Subtitle
- Left: 16pt
- Right: 16pt
- Height: 50pt

**Email TextField:**
- Top: 12pt from Full Name
- Left: 16pt
- Right: 16pt
- Height: 50pt

**Gender Buttons (in HStack):**
- Top: 20pt from Email
- Left: 16pt
- Right: 16pt
- Height: 50pt each (equal width)

**Pickers:**
- Top: 20pt from Gender
- Left: 16pt
- Right: 16pt
- Height: 150pt each

**Next Button:**
- Bottom: 40pt from Safe Area
- Right: 16pt from Safe Area
- Width: 60pt
- Height: 60pt (circular)

### For Other Screens

Use **Add Missing Constraints** feature:
1. Select all views
2. **Editor → Resolve Auto Layout Issues → Add Missing Constraints**

Or manually pin to Safe Area with standard 16pt spacing.

---

## STEP 10: Final Setup

### 10.1 Set App Delegate

1. Select **DoctorRegistrationApp** project
2. Select **DoctorRegistrationApp** target
3. General tab
4. Under Main Interface, verify it's empty (uses SceneDelegate)

### 10.2 Create Scene Delegate (if needed)

If you don't have SceneDelegate:

1. **File → New → File**
2. Select **Cocoa Touch Class**
3. Name: `SceneDelegate`
4. Subclass: `UIResponder`
5. Add the window property and configuration

### 10.3 Update Info.plist

Ensure these entries exist:
- **Application Scene Manifest** → Scene Configuration
- **Main Storyboard file base name**: `Main`

---

## ✅ Verification Checklist

- [ ] Navigation Controller set as initial ViewController
- [ ] Registration ViewController is root of Navigation Controller
- [ ] All IBOutlets connected (blue indicators)
- [ ] All IBActions connected
- [ ] All segues have identifiers
- [ ] Auto Layout constraints added
- [ ] No orange warnings in Document Outline
- [ ] Build succeeds (Cmd + B)
- [ ] No compile errors

---

## 🚀 Next Steps

1. Build the project: **Cmd + B**
2. Run on simulator: **Cmd + R**
3. Test Registration flow
4. Test navigation between screens
5. Verify all UI elements appear correctly

---

## 💡 Tips

- Use **Document Outline** on the left to see view hierarchy
- Enable **Show Constraints** in Editor menu to verify layout
- Test on multiple device sizes
- Use **View Debugger** (Debug → View Hierarchy) to check constraints
- Add break points in `prepare(for segue:)` to debug navigation

---

## 🐛 Troubleshooting

**Orange warning icons?**
- Select the view
- Editor → Resolve Auto Layout Issues → Add Missing Constraints

**Segue not working?**
- Verify identifier matches in code
- Check ViewController class names
- Ensure all IBOutlets are connected

**Views not showing?**
- Check constraints (should be blue, not red)
- Verify view hierarchy in Document Outline
- Check background colors (might be hidden behind other views)

**App crashes on launch?**
- Check Console for error messages
- Verify storyboard ID is set correctly
- Ensure AppDelegate references correct storyboard

---

**Setup complete! Your app is ready to build and test. 🎉**
