clc, clear all , format compact

 

% Variables

sigma = 7;

mu = 24;

 

% Anonymous Gaussian Function

y = @(x) (1/(sigma*sqrt(2*pi)))*exp(-((x-mu).^2)/(2*sigma^2));

 

% Outputs

y(mu+sigma),y(mu-sigma),y(mu)

 

%% PART II -

clc, clear all, format compact

% Variables

height = 7;         %m

radius = 3;         %m

mass_air = 1.02;    %kg/m3

mass_water = 22;    %kg/m3

 

% Calculation

[volume, surface_area, mass_air, mass_water] = calcCylinderParams(height,radius,mass_air,mass_water);

 

% Output

fprintf('For a cylinder with height %dm and radius %dm, the volume is %dm3 and surface area is %dm2. \n',height,radius,volume,surface_area);

fprintf('If it is made of air, the mass is %dkg. If it is made of water, the mass is %dkg. \n',mass_air,mass_water) 

 

 

 

Function Script: calcCylinderParams.m

 

% Calculate Cylinder Parameters

% Calculate volume, surface area, and masses

% round to two significant figures

function [volume, surface_area, mass_air, mass_water] = calcCylinderParams(height, radius, density_air, density_water)

    

% round everything to two significant figures

 

    % volume

    volume = round( height * pi*radius^2, 2, 'significant');

    % surface area

    surface_area = round( 2*(pi*radius^2) + 2*pi*radius*height, 2, 'significant');

    % mass if air

    mass_air = round( volume * density_air, 2, 'significant');

    % mass if water

    mass_water = round( volume * density_water, 2, 'significant');

    

end
