function pn --wraps='pnpm yarn npm' --description 'Use pnpm, yarn or npm'
    if command -q pnpm
        pnpm $argv
    else if command -q yarn
        yarn $argv
    else
        npm $argv
    end
end
