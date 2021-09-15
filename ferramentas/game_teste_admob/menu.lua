function centerText(text,font,h,offset)
	--Offset: translate X (positivo destra,negativo sinistra)
	offset = offset or 0;
	font = font or love.graphics.getFont()
	local length = font:getWidth(text)
	love.graphics.print(text,love.graphics.getWidth()/2-length/2+offset*scaleX,h/450*screenHeight)
end

function sRectangle( x, y, width, height, radius,scaled,mode)
	if not scaled then scaled = true end
	mode = mode or "fill";
	local mode2;
	if mode == "fill" then mode2 = "pie" else mode2 = "open" end

	if scaled then
		x = x*scaleX
		y = y*scaleY

		width = width*scaleX
		height = height*scaleY
		radius = radius*scaleX
	end

   --Rettangoli
   if mode == "fill" then
	   love.graphics.rectangle(mode, x + radius, y + radius, width - (radius * 2), height - radius * 2)
	   love.graphics.rectangle(mode, x + radius, y, width - (radius * 2), radius)
	   love.graphics.rectangle(mode, x + radius, y + height - radius, width - (radius * 2), radius)
	   love.graphics.rectangle(mode, x, y + radius, radius, height - (radius * 2))
	   love.graphics.rectangle(mode, x + (width - radius), y + radius, radius, height - (radius * 2))
   else
	   love.graphics.line(x + radius, y, x + width - radius,y);
	   love.graphics.line(x + radius, y + height,x + width - radius, y + height);
	   love.graphics.line(x, y + radius, x, y + height - radius);
	   love.graphics.line(x + width, y + radius, x + width,y + height - radius);
   end
   --ARCS
   love.graphics.arc(mode,mode2, x + radius, y + radius, radius, math.rad(-180), math.rad(-90))
   love.graphics.arc(mode,mode2, x + width - radius , y + radius, radius, math.rad(-90), math.rad(0))
   love.graphics.arc(mode,mode2, x + radius, y + height - radius, radius, math.rad(-180), math.rad(-270))
   love.graphics.arc(mode,mode2, x + width - radius , y + height - radius, radius, math.rad(0), math.rad(90))
end

function Write(text,x,y)
	love.graphics.print(text,x/800*screenWidth,y/450*screenHeight)
end

function drawButton(text,x,y,dx,dy,r,color,opt)
	local oldColor = {}
	oldColor.r,oldColor.g,oldColor.b,oldColor.a = getColor()
	r = r or 20
	color = color or {0,0,0,80}
	setColor(color)
	sRectangle(x,y,dx,dy,r,false)
	local sw = love.graphics.getFont():getWidth(text)/scaleX
	local sh = love.graphics.getFont():getHeight(text)/scaleY
	setColor(oldColor.r,oldColor.g,oldColor.b,oldColor.a);
	Write(text,(x+dx/2-sw/2),(y+dy/2-sh/2))
	setColor(oldColor.r,oldColor.g,oldColor.b,oldColor.a);
end

function checkButton(x,y,x2,y2,tx,ty)

	tx = tx or 0
	ty = ty or 0
	if x2 < x then x2 = x+x2 end
	if y2 < y then y2 = y+y2 end

	if mouseX > (x+tx)/800*screenWidth and mouseX < (x2+tx)/800*screenWidth and mouseY > (y+ty)/450*screenHeight and mouseY < (y2+ty)/450*screenHeight then
		return true
	else
		return false
	end
end

function setColor(r,g,b,a)
	a = a or 255;
	if _LOVEVERSION < 11 then return love.graphics.setColor(r,g,b,a) end
	if type(r) == "table" then
		local a = r[4];
		if not a then a = 255 end
		return setColor(r[1],r[2],r[3],r[4]);
	end
	return love.graphics.setColor(r/255,g/255,b/255,a/255);
end

function getColor()
	if _LOVEVERSION < 11 then return love.graphics.getColor() end
	local r,g,b,a = love.graphics.getColor();

	return r*255,g*255,b*255,a*255;

end

function setBackgroundColor(r,g,b,a)
	a = a or 255;
	if _LOVEVERSION < 11 then return love.graphics.setBackgroundColor(r,g,b,a) end
	if type(r) == "table" then
		local a = r[4];
		if not a then a = 255 end
		return setColor(r[1],r[2],r[3],r[4]);
	end
	return love.graphics.setBackgroundColor(r/255,g/255,b/255,a/255);
end

function getBackgroundColor()
	if _LOVEVERSION < 11 then return love.graphics.getBackgroundColor() end
	local r,g,b,a = love.graphics.getBackgroundColor();

	return r*255,g*255,b*255,a*255;

end

function updateMenu(dt)
	screenWidth,screenHeight = love.graphics.getWidth(),love.graphics.getHeight();
	scaleX = 1/800*screenWidth; scaleY = 1/450*screenHeight;
	local w = love.graphics.getFont():getWidth(written.t);
	local h = love.graphics.getFont():getHeight(written.t);

	written.x = written.x + written.vx*dt;
	written.y = written.y + written.vy*dt;

	if written.vx > 0 then
		if written.x > 800 - w then written.vx = -written.vx + math.random(-5,5) end
	elseif written.vx < 0 then
		if written.x < 0 then written.vx = -written.vx + math.random(-5,5) end
	end

	if written.vy > 0 then
		if written.y > 450 - h then written.vy = -written.vy + math.random(-5,5) end
	elseif written.vy < 0 then
		if written.y < 0 then written.vy = -written.vy + math.random(-5,5) end
	end

end

function drawMenu()
	setColor(0,0,0);
	Write(written.t,written.x,written.y);

	drawButton("createBanner",15,20,180,70,20,{255,0,0,255});
	drawButton("showBanner",210,20,180,70,20,{0,255,0,255});
	drawButton("hideBanner",405,20,180,70,20,{0,255,255,255});
	drawButton("requestInterstitial",600,20,180,70,20,{255,255,0,255});

	drawButton("isInterstitialLoaded",15,120,180,70,20,{255,125,0,255});
	drawButton("showInterstitial",210,120,180,70,20,{125,255,0,255});
	drawButton("requestRewardedAd",405,120,180,70,20,{0,255,125,255});
	drawButton("isRewardedAdLoaded",600,120,180,70,20,{125,255,255,255});

	drawButton("showRewardedAd",15,220,180,70,20,{180,100,255,255});
	drawButton("getDeviceLanguage",210,220,180,70,20,{0,125,255,255});
	drawButton("changeAdConsent",405,220,180,70,20,{125,125,255,255});

	centerText("LÖVE Admob 11.3",nil,320);
	setColor(255,0,0);
	love.graphics.setLineWidth(5);
	love.graphics.rectangle("line",0,0,screenWidth,screenHeight);
end

function mouseReleasedMenu(x,y)
	if checkButton(15,20,195,90) then
		print("createBanner pressed!");
		love.ads.createBanner("ca-app-pub-3940256099942544/6300978111","bottom");

	elseif checkButton(210,20,390,90) then
		print("showBanner pressed!");
		love.ads.showBanner();

	elseif checkButton(405,20,585,90) then
		print("hideBanner pressed!");
		love.ads.hideBanner();

	elseif checkButton(600,20,780,90) then
		print("requestInterstitial pressed!");
		love.ads.requestInterstitial("ca-app-pub-3940256099942544/1033173712");

	elseif checkButton(15,120,195,190) then
		print("isInterstitialLoaded pressed!");
		local r = love.ads.isInterstitialLoaded();
		print("isInterstitialLoaded: ", r);

	elseif checkButton(210,120,390,190) then
		print("showInterstitial pressed!");
		love.ads.showInterstitial();

	elseif checkButton(405,120,585,190) then
		print("requestRewardedAd pressed!");
		love.ads.requestRewardedAd("ca-app-pub-3940256099942544/5224354917");

	elseif checkButton(600,120,780,190) then
		print("isRewardedAdLoaded pressed!");
		local r = love.ads.isRewardedAdLoaded();
		print("isRewardedAdLoaded: ", r);

	elseif checkButton(15,220,195,290) then
		print("showRewardedAd pressed!");
		love.ads.showRewardedAd();

	elseif checkButton(210,220,390,290) then
		print("getDeviceLanguage pressed!");
		local l = love.ads.getDeviceLanguage();
		print("getDeviceLanguage: ",l);

	elseif checkButton(405,220,585,290) then
		print("changeEUConsent pressed!");
		love.ads.changeEUConsent();

	end
end

function love.interstitialFailedToLoad()
	print("[ADS] Called callback love.interstitialFailedToLoad.");
end

function love.interstitialClosed()
	print("[ADS] Called callback love.interstitialClosed.");
end

function love.rewardedAdFailedToLoad()
	print("[ADS] Called callback love.interstitialFailedToLoad.");
end

function love.rewardedAdClosed()
	print("[ADS] Called callback love.interstitialClosed.");
end

function love.rewardUserWithReward(rewardType,rewardQuantity)
	print(string.format("[ADS] Called callback love.rewardUserWithReward with rewardType=%s, rewardQuantity=%f.",rewardType,rewardQuantity));
end

function love.rewardedAdDidStop()
	print("[ADS] Called callback love.rewardedAdDidStop.");
end
