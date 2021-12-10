let i = 1534236469


func reverse(_ i: Int) -> Int {
    let j = 10
    var result = 0
    var iteration = 1
    var tmp = i
    var tmpRes = [Int]()
    while tmp/j != 0 {
        tmpRes.append(tmp%j)
        tmp = tmp/j
        iteration = iteration * j
    }
    tmpRes.append(tmp%j)
    for num in tmpRes {
        result += num*iteration
        iteration = iteration / j
    }
    if result > Int32.max || result < Int32.min { return 0 }
    return result
}

print(reverse(i))
