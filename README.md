# LYJAlert
This is an alert framework

### using

1. `pod 'LYJAlert', :git => 'https://github.com/liukan123/LYJAlert.git'`
2. 
```
LYJAlert.showAlert(title: "提示", message: "nishi sb ma")
        
LYJAlert.showAlert(title: "提示", messageL: "nishi sb ma", cancleTitle: "cancle") { (action) in
    print("\(action.title ?? "")")
}

LYJAlert.showAlert(title: "提示", message: "nishi sb ma", cancleTitle: "cancle", defaultTitle: "default") { (action) in
    print("\(action.title ?? "")")
} defaultBlock: { (action) in
    print("\(action.title ?? "")")
}
```

