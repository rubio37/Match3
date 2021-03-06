--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety, shiny)
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety
    self.shiny = shiny

    self.psystem = love.graphics.newParticleSystem(particle, 20)
    self.psystem:setParticleLifetime(0.5, 1.2)
    self.psystem:setLinearAcceleration(10, 10, 10, 10)
    self.psystem:setAreaSpread('normal', 7, 7)
    self.psystem:setColors(251, 242, 54, 150, 155, 99, 223, 90, 256, 256, 256, 150)
end

function Tile:update(dt)
    if self.shiny then
        self.psystem:emit(10)
    end
    self.psystem:update(dt)
end

--[[
    Function to swap this tile with another tile, tweening the two's positions.
]]
function Tile:swap(tile)

end

function Tile:render(x, y)
    -- draw shadow
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety], self.x + x, self.y + y)
end

function Tile:renderParticles(x, y)
    love.graphics.draw(self.psystem, self.x + x + 16, self.y + y + 16)
end