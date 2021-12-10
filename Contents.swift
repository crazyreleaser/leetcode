public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

let l1 = ListNode(2, ListNode(4, ListNode(3)))
let l2 = ListNode(5, ListNode(6, ListNode(4)))

func printListNodes(_ l: ListNode?) {
    if let val = l?.val {
        print(val," ")
    }
    if let next = l?.next {
        printListNodes(next)
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode?{
    if l1 == nil && l2 == nil { return nil }
    let sum = (l1?.val ?? 0) + (l2?.val ?? 0)
    if sum >= 10 {
        return ListNode(sum-10, addTwoNumbers(ListNode(1), addTwoNumbers(l1?.next, l2?.next)))
    } else {
        return ListNode(sum, addTwoNumbers(l1?.next, l2?.next))
    }
}

func addTwoNumbers1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode?{
    var result: ListNode?
    var tmpRes: ListNode?
    var perenos = 0
    
    if let val1 = l1?.val {
        if let val2 = l2?.val{
            result = ListNode((val1 + val2) % 10)
            perenos = (val1 + val2) / 10
        } else {
            result = ListNode(val1)
        }
    } else {
        if let val2 = l2?.val{
            result = ListNode(val2)
        } else {
            result = nil
        }
    }
    
    if let next1 = l1?.next {
        if let next2 = l2?.next {
            tmpRes = addTwoNumbers(next1, next2)
        } else {
            tmpRes = addTwoNumbers(next1, ListNode())
        }
    } else {
        if let next2 = l2?.next {
            tmpRes = addTwoNumbers(ListNode(), next2)
        } else {
            tmpRes = nil
        }
    }

    if perenos != 0 {
        result?.next = addTwoNumbers(tmpRes, ListNode(perenos))
    } else {
        result?.next = tmpRes
    }

    return result
    
}

printListNodes(addTwoNumbers1(l1, l2))
