function levenshtein_distance(word1::AbstractString, word2::AbstractString)::Int
    m, n = length(word1), length(word2)
    dp = zeros(Int, m+1, n+1)

    for i in 1:m+1
        dp[i, 1] = i - 1
    end

    for j in 1:n+1
        dp[1, j] = j - 1
    end

    for j in 2:n+1, i in 2:m+1
        if word1[i-1] == word2[j-1]
            dp[i, j] = dp[i-1, j-1]
        else
            dp[i, j] = 1 + min(dp[i-1, j], dp[i, j-1], dp[i-1, j-1])
        end
    end

    return dp[m+1, n+1]
end

println(levenshtein_distance("Hello", "World")) #return 4
