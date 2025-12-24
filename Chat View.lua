local TextChatService = game:GetService('TextChatService');
local ChatWindowConfiguration = TextChatService and TextChatService:FindFirstChild('ChatWindowConfiguration');

if not ChatWindowConfiguration then
    return
end

ChatWindowConfiguration.Enabled = true;

