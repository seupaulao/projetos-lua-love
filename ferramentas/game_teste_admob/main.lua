require("menu");

function love.load()
	local w,h = love.window.getDesktopDimensions(1)
	_LOVEVERSION = love.getVersion();
	love.keyboard.setTextInput(false);
	love.keyboard.setKeyRepeat(true);
	OS = love.system.getOS();
	setBackgroundColor(255,255,255);
	screenWidth,screenHeight = love.graphics.getWidth(),love.graphics.getHeight();
	mouseX,mouseY = love.mouse.getPosition();
	scaleX = 1/800*screenWidth; scaleY = 1/450*screenHeight;
	
	written = {t = "Hello from LÖVE",x = 100,y = 100,vx = 75,vy = 75};
	
end

function love.update(dt)
	mouseX,mouseY = love.mouse.getPosition();
	fps = love.timer.getFPS();

	updateMenu(dt);

end

function love.draw()
	drawMenu(dt);
end

function love.textinput(t)
	
end

function love.keypressed(k)
	
end

function love.keyreleased(k)
	
end

function love.mousepressed(x,y,b)
	mousePressed = true;
	mouseX,mouseY = x,y;
	
end

function love.mousereleased(x,y,b)
	mousePressed = false;
	mouseX,mouseY = x,y;
	
	mouseReleasedMenu(x,y);

end

