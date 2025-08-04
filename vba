Sub CreateRBCInternshipPresentation()
    Dim pptApp As Application
    Dim pptPres As Presentation
    Dim pptSlide As Slide
    Dim pptShape As Shape
    
    ' Set reference to PowerPoint application
    Set pptApp = Application
    Set pptPres = pptApp.ActivePresentation
    
    ' Clear existing slides (optional - comment out if you want to keep existing slides)
    While pptPres.Slides.Count > 0
        pptPres.Slides(1).Delete
    Wend
    
    ' Define RBC Colors
    Dim rbcBlue As Long: rbcBlue = RGB(0, 93, 170)
    Dim rbcDarkBlue As Long: rbcDarkBlue = RGB(0, 63, 127)
    Dim rbcYellow As Long: rbcYellow = RGB(255, 210, 0)
    Dim rbcGray As Long: rbcGray = RGB(107, 119, 133)
    
    ' SLIDE 1: Title Slide
    Set pptSlide = pptPres.Slides.Add(1, ppLayoutBlank)
    pptSlide.FollowMasterBackground = False
    pptSlide.Background.Fill.ForeColor.RGB = rbcBlue
    
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 150, 824, 100)
    With pptShape.TextFrame.TextRange
        .Text = "DSS Internship Projects"
        .Font.Size = 48
        .Font.Color.RGB = RGB(255, 255, 255)
        .Font.Bold = False
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 250, 824, 80)
    With pptShape.TextFrame.TextRange
        .Text = "Improving Operational Efficiency Through Technology"
        .Font.Size = 28
        .Font.Color.RGB = RGB(255, 255, 255)
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 362, 350, 200, 60)
    With pptShape
        .Fill.ForeColor.RGB = rbcDarkBlue
        .Line.Visible = False
        With .TextFrame.TextRange
            .Text = "RBC"
            .Font.Size = 36
            .Font.Color.RGB = RGB(255, 255, 255)
            .Font.Bold = True
            .ParagraphFormat.Alignment = ppAlignCenter
        End With
    End With
    
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 450, 824, 120)
    With pptShape.TextFrame.TextRange
        .Text = "Artem Guz" & vbCrLf & "DSS Summer Analyst" & vbCrLf & "End-User Services"
        .Font.Size = 24
        .Font.Color.RGB = RGB(255, 255, 255)
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' SLIDE 2: Agenda
    Set pptSlide = pptPres.Slides.Add(2, ppLayoutText)
    pptSlide.Shapes(1).TextFrame.TextRange.Text = "Agenda"
    pptSlide.Shapes(1).TextFrame.TextRange.Font.Color.RGB = rbcBlue
    
    With pptSlide.Shapes(2).TextFrame.TextRange
        .Text = "Project 1: Angriest IP Scanner" & vbCrLf & _
                "• Enhanced network asset management tool for Windows 11 migration" & vbCrLf & vbCrLf & _
                "Project 2: OfficeOps" & vbCrLf & _
                "• Real-time office space management system" & vbCrLf & vbCrLf & _
                "Impact & Results" & vbCrLf & _
                "• Measurable improvements to team efficiency"
        .Font.Size = 20
        .ParagraphFormat.SpaceAfter = 12
    End With
    
    ' Add RBC logo to slide 2
    AddRBCLogo pptSlide
    
    ' SLIDE 3: Angriest IP Scanner Overview
    Set pptSlide = pptPres.Slides.Add(3, ppLayoutTwoObjects)
    pptSlide.Shapes(1).TextFrame.TextRange.Text = "Angriest IP Scanner"
    pptSlide.Shapes(1).TextFrame.TextRange.Font.Color.RGB = rbcBlue
    
    ' Add subtitle
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 120, 824, 40)
    With pptShape.TextFrame.TextRange
        .Text = "From PowerShell Scripts to Enterprise Application"
        .Font.Size = 18
        .Font.Color.RGB = rbcGray
        .Font.Italic = True
    End With
    
    With pptSlide.Shapes(2).TextFrame.TextRange
        .Text = "Evolution" & vbCrLf & _
                "• 2024: Simple PowerShell scripts" & vbCrLf & _
                "• 2025: Full Windows application with GUI" & vbCrLf & _
                "• Daily use by entire DSS team" & vbCrLf & _
                "• Critical for Windows 11 migration"
        .Font.Size = 18
    End With
    
    ' Placeholder for screenshot
    Set pptShape = pptSlide.Shapes(3)
    With pptShape
        .Fill.ForeColor.RGB = RGB(232, 232, 232)
        .Line.ForeColor.RGB = rbcGray
        .Line.DashStyle = msoLineDash
    End With
    With pptShape.TextFrame.TextRange
        .Text = "[Screenshot: IP Scanner Interface]"
        .Font.Size = 14
        .Font.Italic = True
        .Font.Color.RGB = rbcGray
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Add stat box
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 480, 824, 80)
    With pptShape
        .Fill.ForeColor.RGB = RGB(244, 244, 246)
        .Line.ForeColor.RGB = rbcBlue
        .Line.Weight = 3
        With .TextFrame.TextRange
            .Text = "Primary Use Case: Detecting Windows 10 machines and determining upgrade path (in-place upgrade vs. hardware swap) based on hardware compatibility"
            .Font.Size = 16
            .Font.Bold = True
        End With
    End With
    
    AddRBCLogo pptSlide
    
    ' SLIDE 4: IP Scanner Features
    Set pptSlide = pptPres.Slides.Add(4, ppLayoutBlank)
    
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 50, 824, 60)
    With pptShape.TextFrame.TextRange
        .Text = "Key Features & Enhancements"
        .Font.Size = 42
        .Font.Color.RGB = rbcBlue
        .Font.Bold = True
    End With
    
    ' Feature boxes
    Dim features As Variant
    features = Array( _
        Array("🔍", "Multi-Mode Scanning", "• Individual IP/Hostname" & vbCrLf & "• IP segments (256 IPs)" & vbCrLf & "• CSV bulk import" & vbCrLf & "• Clipboard paste support"), _
        Array("📊", "25+ Data Points", "• Hardware specifications" & vbCrLf & "• Windows/Office versions" & vbCrLf & "• BIOS information" & vbCrLf & "• Network configurations"), _
        Array("🚀", "Performance", "• 20% speed improvement" & vbCrLf & "• Parallel processing" & vbCrLf & "• Smart batching" & vbCrLf & "• Full network scan < 5 min"), _
        Array("📍", "Smart Mapping", "• Auto floor detection" & vbCrLf & "• Network segment mapping" & vbCrLf & "• 30 Hudson integration" & vbCrLf & "• Export to CSV") _
    )
    
    Dim i As Integer, j As Integer
    For i = 0 To 3
        Dim xPos As Integer: xPos = 50 + (i Mod 2) * 437
        Dim yPos As Integer: yPos = 150 + (i \ 2) * 200
        
        Set pptShape = pptSlide.Shapes.AddShape(msoShapeRectangle, xPos, yPos, 387, 180)
        With pptShape
            .Fill.ForeColor.RGB = RGB(248, 249, 250)
            .Line.ForeColor.RGB = RGB(225, 227, 230)
            
            With .TextFrame.TextRange
                .Text = features(i)(0) & vbCrLf & features(i)(1) & vbCrLf & features(i)(2)
                .Font.Size = 14
                .ParagraphFormat.Alignment = ppAlignCenter
                
                ' Format icon
                .Paragraphs(1).Font.Size = 36
                ' Format title
                .Paragraphs(2).Font.Size = 18
                .Paragraphs(2).Font.Bold = True
                .Paragraphs(2).Font.Color.RGB = rbcBlue
                ' Format bullets
                For j = 3 To .Paragraphs.Count
                    .Paragraphs(j).Font.Size = 12
                    .Paragraphs(j).ParagraphFormat.Alignment = ppAlignLeft
                Next j
            End With
        End With
    Next i
    
    ' Tech stack
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 560, 824, 40)
    With pptShape.TextFrame.TextRange
        .Text = "Tech Stack: C# .NET 8 | WPF | WMI | Async/Parallel"
        .Font.Size = 16
        .Font.Color.RGB = rbcBlue
    End With
    
    AddRBCLogo pptSlide
    
    ' SLIDE 5: IP Scanner Impact
    Set pptSlide = pptPres.Slides.Add(5, ppLayoutBlank)
    
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 50, 824, 60)
    With pptShape.TextFrame.TextRange
        .Text = "Angriest IP Scanner - Impact"
        .Font.Size = 42
        .Font.Color.RGB = rbcBlue
        .Font.Bold = True
    End With
    
    ' Impact metrics
    Dim metrics As Variant
    metrics = Array( _
        Array("⏱️", "2 hours saved per floor", "Eliminated manual floor walks for asset identification"), _
        Array("🏢", "30+ hours weekly savings", "Across 15 floors in 30 Hudson buildings"), _
        Array("💻", "360 hours saved", "During 3-month Windows 11 migration period") _
    )
    
    For i = 0 To 2
        Set pptShape = pptSlide.Shapes.AddShape(msoShapeRectangle, 50, 150 + i * 100, 824, 80)
        With pptShape
            .Fill.ForeColor.RGB = RGB(230, 242, 250)
            .Line.Visible = False
            
            With .TextFrame.TextRange
                .Text = metrics(i)(0) & "  " & metrics(i)(1) & vbCrLf & metrics(i)(2)
                .Font.Size = 16
                
                ' Format metric value
                .Words(2).Font.Size = 24
                .Words(2).Font.Bold = True
                .Words(2).Font.Color.RGB = rbcBlue
            End With
        End With
    Next i
    
    ' Before/After comparison
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 460, 824, 40)
    With pptShape.TextFrame.TextRange
        .Text = "Before vs After"
        .Font.Size = 20
        .Font.Bold = True
    End With
    
    ' Before box
    Set pptShape = pptSlide.Shapes.AddShape(msoShapeRectangle, 50, 500, 387, 60)
    With pptShape
        .Fill.ForeColor.RGB = RGB(255, 240, 240)
        .Line.ForeColor.RGB = RGB(196, 38, 46)
        With .TextFrame.TextRange
            .Text = "Before: Manual floor walks, visual inspection, paper tracking"
            .Font.Size = 14
        End With
    End With
    
    ' After box
    Set pptShape = pptSlide.Shapes.AddShape(msoShapeRectangle, 487, 500, 387, 60)
    With pptShape
        .Fill.ForeColor.RGB = RGB(240, 255, 240)
        .Line.ForeColor.RGB = RGB(0, 138, 0)
        With .TextFrame.TextRange
            .Text = "After: Remote scanning, instant results, automated reports"
            .Font.Size = 14
        End With
    End With
    
    AddRBCLogo pptSlide
    
    ' SLIDE 6: OfficeOps Overview
    Set pptSlide = pptPres.Slides.Add(6, ppLayoutTwoObjects)
    pptSlide.Shapes(1).TextFrame.TextRange.Text = "OfficeOps"
    pptSlide.Shapes(1).TextFrame.TextRange.Font.Color.RGB = rbcBlue
    
    ' Add subtitle
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 120, 824, 40)
    With pptShape.TextFrame.TextRange
        .Text = "Modern Office Space Management System"
        .Font.Size = 18
        .Font.Color.RGB = rbcGray
        .Font.Italic = True
    End With
    
    With pptSlide.Shapes(2).TextFrame.TextRange
        .Text = "The Challenge" & vbCrLf & _
                "• Static Excel files from real estate" & vbCrLf & _
                "• No visualization of office layout" & vbCrLf & _
                "• Manual updates taking hours" & vbCrLf & _
                "• No audit trail or history" & vbCrLf & _
                "• Difficult to track occupancy"
        .Font.Size = 18
    End With
    
    ' Placeholder for screenshot
    Set pptShape = pptSlide.Shapes(3)
    With pptShape
        .Fill.ForeColor.RGB = RGB(232, 232, 232)
        .Line.ForeColor.RGB = rbcGray
        .Line.DashStyle = msoLineDash
    End With
    With pptShape.TextFrame.TextRange
        .Text = "[Screenshot: OfficeOps Dashboard]"
        .Font.Size = 14
        .Font.Italic = True
        .Font.Color.RGB = rbcGray
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Add solution box
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 480, 824, 80)
    With pptShape
        .Fill.ForeColor.RGB = RGB(244, 244, 246)
        .Line.ForeColor.RGB = rbcBlue
        .Line.Weight = 3
        With .TextFrame.TextRange
            .Text = "Solution: Full-stack web application providing real-time seat management, visual dashboards, and automated Excel import/export with conflict resolution"
            .Font.Size = 16
            .Font.Bold = True
        End With
    End With
    
    AddRBCLogo pptSlide
    
    ' SLIDE 7: OfficeOps Features
    Set pptSlide = pptPres.Slides.Add(7, ppLayoutTwoObjects)
    pptSlide.Shapes(1).TextFrame.TextRange.Text = "OfficeOps - Key Features"
    pptSlide.Shapes(1).TextFrame.TextRange.Font.Color.RGB = rbcBlue
    
    With pptSlide.Shapes(2).TextFrame.TextRange
        .Text = "Core Functionality" & vbCrLf & _
                "• Real-time seat assignments" & vbCrLf & _
                "• Bulk Excel import/export" & vbCrLf & _
                "• Intelligent conflict resolution" & vbCrLf & _
                "• Complete audit trail" & vbCrLf & _
                "• Multi-building support" & vbCrLf & vbCrLf & _
                "Reporting" & vbCrLf & _
                "• Occupancy by business group" & vbCrLf & _
                "• Floor utilization metrics" & vbCrLf & _
                "• Vacancy analysis" & vbCrLf & _
                "• Transit number tracking"
        .Font.Size = 16
    End With
    
    ' Add placeholder for screenshots
    Set pptShape = pptSlide.Shapes(3)
    With pptShape
        .Fill.ForeColor.RGB = RGB(232, 232, 232)
        .Line.ForeColor.RGB = rbcGray
        .Line.DashStyle = msoLineDash
    End With
    With pptShape.TextFrame.TextRange
        .Text = "[Screenshot: Seat Management Interface]"
        .Font.Size = 14
        .Font.Italic = True
        .Font.Color.RGB = rbcGray
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Tech stack
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 520, 824, 40)
    With pptShape.TextFrame.TextRange
        .Text = "Tech Stack: React | Node.js | MongoDB | Express | ExcelJS"
        .Font.Size = 16
        .Font.Color.RGB = rbcBlue
    End With
    
    AddRBCLogo pptSlide
    
    ' SLIDE 8: Combined Impact
    Set pptSlide = pptPres.Slides.Add(8, ppLayoutBlank)
    
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 50, 824, 60)
    With pptShape.TextFrame.TextRange
        .Text = "Overall Impact & Results"
        .Font.Size = 42
        .Font.Color.RGB = rbcBlue
        .Font.Bold = True
    End With
    
    ' Add banner
    Set pptShape = pptSlide.Shapes.AddShape(msoShapeRectangle, 0, 130, 924, 60)
    With pptShape
        .Fill.ForeColor.RGB = rbcBlue
        .Line.Visible = False
        With .TextFrame.TextRange
            .Text = "Transforming DSS Operations Through Innovation"
            .Font.Size = 24
            .Font.Color.RGB = rbcYellow
            .Font.Bold = True
            .ParagraphFormat.Alignment = ppAlignCenter
        End With
    End With
    
    ' Two columns for impacts
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 220, 387, 200)
    With pptShape.TextFrame.TextRange
        .Text = "Angriest IP Scanner" & vbCrLf & _
                "• 360 hours saved during migration" & vbCrLf & _
                "• 100% network visibility" & vbCrLf & _
                "• 5 minutes full network scan" & vbCrLf & _
                "• Proactive hardware planning"
        .Font.Size = 16
        .Paragraphs(1).Font.Size = 20
        .Paragraphs(1).Font.Bold = True
        .Paragraphs(1).Font.Color.RGB = rbcBlue
    End With
    
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 487, 220, 387, 200)
    With pptShape.TextFrame.TextRange
        .Text = "OfficeOps" & vbCrLf & _
                "• Real-time updates vs hours" & vbCrLf & _
                "• 100% audit compliance" & vbCrLf & _
                "• Visual space utilization" & vbCrLf & _
                "• Data-driven decisions"
        .Font.Size = 16
        .Paragraphs(1).Font.Size = 20
        .Paragraphs(1).Font.Bold = True
        .Paragraphs(1).Font.Color.RGB = rbcBlue
    End With
    
    ' Key takeaway box
    Set pptShape = pptSlide.Shapes.AddShape(msoShapeRectangle, 50, 440, 824, 120)
    With pptShape
        .Fill.ForeColor.RGB = RGB(230, 242, 250)
        .Line.Visible = False
        With .TextFrame.TextRange
            .Text = "Key Takeaway" & vbCrLf & vbCrLf & _
                    "Both solutions are currently in production, actively used by the DSS team, " & _
                    "and directly contributing to improved operational efficiency at RBC."
            .Font.Size = 18
            .ParagraphFormat.Alignment = ppAlignCenter
            .Paragraphs(1).Font.Size = 22
            .Paragraphs(1).Font.Bold = True
            .Paragraphs(1).Font.Color.RGB = rbcBlue
        End With
    End With
    
    AddRBCLogo pptSlide
    
    ' SLIDE 9: Thank You
    Set pptSlide = pptPres.Slides.Add(9, ppLayoutBlank)
    pptSlide.FollowMasterBackground = False
    pptSlide.Background.Fill.ForeColor.RGB = rbcBlue
    
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 150, 824, 80)
    With pptShape.TextFrame.TextRange
        .Text = "Thank You"
        .Font.Size = 48
        .Font.Color.RGB = RGB(255, 255, 255)
        .Font.Bold = False
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 362, 250, 200, 80)
    With pptShape
        .Fill.ForeColor.RGB = rbcDarkBlue
        .Line.Visible = False
        With .TextFrame.TextRange
            .Text = "RBC"
            .Font.Size = 48
            .Font.Color.RGB = RGB(255, 255, 255)
            .Font.Bold = True
            .ParagraphFormat.Alignment = ppAlignCenter
        End With
    End With
    
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 350, 824, 60)
    With pptShape.TextFrame.TextRange
        .Text = "Questions?"
        .Font.Size = 28
        .Font.Color.RGB = RGB(255, 255, 255)
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    Set pptShape = pptSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 450, 824, 120)
    With pptShape.TextFrame.TextRange
        .Text = "Artem Guz" & vbCrLf & _
                "DSS Summer Analyst | End-User Services" & vbCrLf & vbCrLf & _
                "Now I'll hand it over to my colleague Carolina."
        .Font.Size = 20
        .Font.Color.RGB = RGB(255, 255, 255)
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    MsgBox "Presentation created successfully! You now have 9 slides ready.", vbInformation, "Success"
End Sub

' Helper function to add RBC logo to slides
Sub AddRBCLogo(sld As Slide)
    Dim logoShape As Shape
    Set logoShape = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 824, 20, 80, 40)
    With logoShape
        .Fill.ForeColor.RGB = RGB(0, 93, 170)
        .Line.Visible = False
        With .TextFrame.TextRange
            .Text = "RBC"
            .Font.Size = 18
            .Font.Color.RGB = RGB(255, 255, 255)
            .Font.Bold = True
            .ParagraphFormat.Alignment = ppAlignCenter
        End With
    End With
End Sub
