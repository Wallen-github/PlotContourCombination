%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Description:    This file is a smaple for 'PlotContourCombination.m'.
%                   Place the data file (PlotContourCombination_Data.mat)
%                   in the same directory and click 'Run'.
%
%   Author:         Hai-Shuo Wang
%   Address:        School of Astronomy and Space Science
%                   Nanjing University
%                   China
%   Email:          wanghs@smail.nju.edu.cn
%   Date:           2020.10.27 16:30
%   Version:        1.0
%   Information:    A sample for funtion 'PlotContourCombination'.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;

% 加载数据
load('PlotContourCombination_Data.mat');

% 设置输入参数
Row = 3; % 行数
Column = 4; % 列数
LeftMargin = 0.08; % 左边距
BottomMargin = 0.08; % 右边距
gap = 0; % 子图间间距
gcaFontSize = 20; % 坐标轴刻度和名称大小

% 绘制图形
% XY为横纵坐标轴数值，XY(:,2,index)为横轴坐标，XY(:,1,index)为纵轴坐标
% ContourData(m,n,index)为m*n的contour图数据
% index 子图指示器，必须有Row*Column<index
PlotContourCombination(XY,ContourData,Row,Column,LeftMargin...
                                ,BottomMargin,gap,gcaFontSize)

