# [prev, next, key, value]

class LRU

    constructor: (@max)->
        @head = []
        @head[0] = @head
        @head[1] = @head
        @size = 0

    get: (key)->
        [prev, node] = @head
        while node isnt @head
            [prev, next, _key, val] = node
            if _key is key
                [_, first] = @head
                if @size > 1 and node isnt first
                    @swap first, node
                return val
            node = next

    swap: (n1, n2)->
        if n2[0] is n1
            [pre] = n1
            [_, next] = n2
            n2[0] = pre
            pre[1] = n2
            n2[1] = n1
            n1[0] = n2
            n1[1] = next
            next[0] = n1
        else
            [pre1, next1] = n1
            [pre2, next2] = n2
            pre1[1] = n2
            next1[0] = n2
            pre2[1] = n1
            next2[0] = n1
            n2[0] = pre1
            n2[1] = next1
            n1[0] = pre2
            n1[1] = next2

    set: (key, val)->
        if @size >= @max
            [last, first] = @head
            [butlast] = last
            butlast[1] = @head
            @head[0] = butlast
            @size -= 1
        [_, first] = @head
        node = [@head, first, key, val]
        @head[1] = node
        first[0] = node
        @size += 1

module.exports = LRU
