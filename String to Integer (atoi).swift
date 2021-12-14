

let i = "+-12"

func myAtoi(_ s: String) -> Int {
    var tmpRes = ""
    var result = 0
    var sign = true     // true = +, false = -
    var startPositionFinded = false
    for i in s {
        if i.isNumber {
            if !startPositionFinded {
                startPositionFinded = true
            }
            tmpRes.append(i)
            continue
        }
        if startPositionFinded && !i.isNumber {
            break
        }
        if !startPositionFinded && !i.isNumber {
            if i == "-" {
                if tmpRes.count != 0 {
                    print("case 4")
                    break
                }
                startPositionFinded = true
                sign = false
                continue
            } else if i == "+" {
                startPositionFinded = true
                sign = true
                continue
            } else if i == " " || i == "_" {
                continue
            } else {
                return 0
            }
        }
    }
    if tmpRes.count == 0 { return 0 }
    result = Int(tmpRes) ?? 0
    if !sign {
        result *= -1
    }
    if result > Int32.max || ( result == 0 && tmpRes.first != "0" && sign) {
        result = Int(Int32.max)
    }
    if result < Int32.min || ( result == 0 && tmpRes.first != "0" && !sign){
        result = Int(Int32.min)
    }
    return result
}

func Atoi(_ s: String) -> Int {
    var number: Int = 0
    var sign: Int = 0
    var foundFirstChar: Bool = false
    
    for c in s {
        if c == " " {
            if foundFirstChar { break }
            continue
        }
        
        if c == "-" {
            if sign != 0 { break }
            foundFirstChar = true
            sign = -1
            continue
        }
        
        if c == "+" {
            if sign != 0 { break }
            foundFirstChar = true
            sign = 1
            continue
        }
        
        if c >= "0" && c <= "9" {
            foundFirstChar = true
            
            if sign == 0 {
                sign = 1
            }
            
            number *= 10
            number += Int(c.toInt())
            
            if (number * sign) >= Int32.max {
                return Int(Int32.max)
            } else if (number * sign) <= Int32.min {
                return Int(Int32.min)
            }
            
            continue
        }
        
        break
    }
    
    number *= sign
    number = min(number, Int(Int32.max))
    number = max(number, Int(Int32.min))
    
    return number
}

extension Character {
    func toInt() -> Int {
        return Int(self.asciiValue! - Character("0").asciiValue!)
    }
}

print(myAtoi(i))
print(Atoi("200000000000000000000000000000"))
