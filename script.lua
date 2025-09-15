lua
-- Таблица с примерами допустимых ключей
local valid_keys = {
    "GEOJHF-F24K-KHRE",
    "Q0GR6Y-93D7-AFEH",
    "FFK42LG-L2U8-CLEE",
    "S8KHX2T-32F8-WKFE"
}
-- hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AlgolHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 240)
Frame.Position = UDim2.new(0.35, 0, 0.35, 0)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local Gradient = Instance.new("UIGradient", Frame)
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 0, 50)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(60, 0, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 0, 50))
}
Gradient.Rotation = 45

local gradientTween = TweenService:Create(Gradient, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Rotation = 405})
gradientTween:Play()

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 15)

local BorderFrame = Instance.new("Frame", Frame)
BorderFrame.Size = UDim2.new(1, 4, 1, 4)
BorderFrame.Position = UDim2.new(0, -2, 0, -2)
BorderFrame.BackgroundTransparency = 0.3
BorderFrame.ZIndex = Frame.ZIndex - 1

local BorderGradient = Instance.new("UIGradient", BorderFrame)
BorderGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 128)),
    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(128, 0, 255)),
    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 128, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 128))
}

local BorderCorner = Instance.new("UICorner", BorderFrame)
BorderCorner.CornerRadius = UDim.new(0, 17)

local borderTween = TweenService:Create(BorderGradient, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false), {Rotation = 360})
borderTween:Play()

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "ALGOL HUB"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24
Title.ZIndex = 10

local titleGradient = Instance.new("UIGradient", Title)
titleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 128)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 128, 0))
}

local titleTween = TweenService:Create(titleGradient, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false), {Rotation = 360})
titleTween:Play()

local Subtitle = Instance.new("TextLabel", Frame)
Subtitle.Size = UDim2.new(1, 0, 0, 20)
Subtitle.Position = UDim2.new(0, 0, 0, 35)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "algol boosters"
Subtitle.Font = Enum.Font.Gotham
Title.TextColor3 = Color3.fromRGB(200, 200, 200)
Subtitle.TextSize = 12
Subtitle.TextTransparency = 0.3

local function makeBtn(text, ypos)
    local btnFrame = Instance.new("Frame", Frame)
    btnFrame.Size = UDim2.new(0.85, 0, 0, 38)
    btnFrame.Position = UDim2.new(0.075, 0, 0, ypos)
    btnFrame.BackgroundTransparency = 1

    local glow = Instance.new("Frame", btnFrame)
    glow.Size = UDim2.new(1, 6, 1, 6)
    glow.Position = UDim2.new(0, -3, 0, -3)
    glow.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
    glow.BackgroundTransparency = 0.8
    glow.ZIndex = btnFrame.ZIndex - 1
    
    local glowCorner = Instance.new("UICorner", glow)
    glowCorner.CornerRadius = UDim.new(0, 12)

    local b = Instance.new("TextButton", btnFrame)
    b.Size = UDim2.new(1, 0, 1, 0)
    b.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 16
    b.Text = text
    b.ZIndex = 10

    local btnCorner = Instance.new("UICorner", b)
    btnCorner.CornerRadius = UDim.new(0, 10)

    local btnGradient = Instance.new("UIGradient", b)
    btnGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 0, 120)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 0, 80))
    }
    btnGradient.Rotation = 90

    b.MouseEnter:Connect(function()
        local hoverTween = TweenService:Create(glow, TweenInfo.new(0.2), {BackgroundTransparency = 0.5})
        hoverTween:Play()
        local scaleTween = TweenService:Create(btnFrame, TweenInfo.new(0.2), {Size = UDim2.new(0.88, 0, 0, 40)})
        scaleTween:Play()
    end)

    b.MouseLeave:Connect(function()
        local hoverTween = TweenService:Create(glow, TweenInfo.new(0.2), {BackgroundTransparency = 0.8})
        hoverTween:Play()
        local scaleTween = TweenService:Create(btnFrame, TweenInfo.new(0.2), {Size = UDim2.new(0.85, 0, 0, 38)})
        scaleTween:Play()
    end)

    return b, glow
end
-- hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
-- Функция для проверки, является ли введенный ключ допустимым
local function is_key_valid(entered_key)
    for _, valid_key in ipairs(valid_keys) do
        if entered_key == valid_key then
            return true -- Ключ найден в списке допустимых
        end
    end
    return false -- Ключ не найден
end

-- Функция, имитирующая запрос ключа через окно
-- В реальном приложении здесь будет код для вызова GUI-библиотеки
local function request_key_from_user()
    print("----------------------------------------")
    print("Лицензионная активация")
    print("----------------------------------------")
    print("Пожалуйста, введите ваш лицензионный ключ:")
    print("----------------------------------------")

    -- В реальном GUI здесь будет отображаться окно с полем ввода текста
    -- и кнопкой "Активировать".
    -- Для имитации, мы будем использовать стандартный ввод.

    local entered_key = io.read() -- Читаем ввод пользователя из консоли

    -- В реальном GUI, вам, вероятно, придется ждать, пока пользователь
    -- не нажмет кнопку. Здесь мы просто возвращаем введенное значение.
    return entered_key
end

-- Основная логика программы
local function main()
    local user_key = request_key_from_user()

    if user_key then
        if is_key_valid(user_key) then
            print("\n----------------------------------------")
            print("Ключ успешно активирован! Добро пожаловать!")
            print("----------------------------------------")
            -- Здесь можно продолжить выполнение основной части программы
        else
            print("\n----------------------------------------")
            print("Ошибка: Неверный лицензионный ключ.")
            print("Пожалуйста, проверьте правильность ввода или обратитесь в поддержку.")
            print("----------------------------------------")
            -- Здесь можно добавить повторный запрос ключа или завершить программу
        end
    else
        print("\n----------------------------------------")
        print("Ввод ключа отменен.")
        print("----------------------------------------")
        -- Можно завершить программу, если ввод был отменен
    end
end

-- Запуск основной функции

main()

