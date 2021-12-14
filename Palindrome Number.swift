func isPalindrome(_ x: Int) -> Bool {
    
    if x < 0 { return false }
    var i = x
    var num = [Int]()
    var count = 0
    while i / 10 > 0 {
        count += 1
        num.append(i%10)
        i = i / 10
    }
    if i != 0 {
        count += 1
        num.append(i)
    }
    for index in 0..<count {
        print(num[index] , num[count-1-index])
        if !(num[index] == num[count-1-index]) { return false }
    }
    
    return true
}

func isPalindrome(_ x: Int) -> Bool {
        if (x<0 || (x%10 == 0 && x != 0)) {
            return false
        }
        var num = x
        var rev = 0 
        while num > rev {
            rev = rev * 10 + num % 10
            num /= 10
        } 
        
        return num == rev || num == rev/10  
    }


print(isPalindrome(11))
