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
                [last, first] = @head
                if @size > 1 and node isnt first
                    @swap node, first
                return val
            node = next

    swap: (n1, n2)->
        [_, _, k1, v1] = n1
        [_, _, k2, v2] = n2
        n1[2] = k2
        n1[3] = v2
        n2[2] = k1
        n2[3] = v1

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
