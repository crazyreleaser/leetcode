
let nums1: [Int] = [0,0]
let nums2: [Int] = [0,0]

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let sorted = (nums1 + nums2).sorted()
    if sorted.count.isEven {
        return Double(sorted[sorted.count/2] + sorted[sorted.count/2-1])/2
    } else {
        return Double(sorted[sorted.count/2])
    }
    
}

print(findMedianSortedArrays(nums1, nums2))

extension Int {
    var isOdd: Bool {
        return !self.isMultiple(of: 2)
    }

    var isEven: Bool {
        return self.isMultiple(of: 2)
    }
}
