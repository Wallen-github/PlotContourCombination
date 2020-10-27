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

% ��������
load('PlotContourCombination_Data.mat');

% �����������
Row = 3; % ����
Column = 4; % ����
LeftMargin = 0.08; % ��߾�
BottomMargin = 0.08; % �ұ߾�
gap = 0; % ��ͼ����
gcaFontSize = 20; % ������̶Ⱥ����ƴ�С

% ����ͼ��
% XYΪ������������ֵ��XY(:,2,index)Ϊ�������꣬XY(:,1,index)Ϊ��������
% ContourData(m,n,index)Ϊm*n��contourͼ����
% index ��ͼָʾ����������Row*Column<index
PlotContourCombination(XY,ContourData,Row,Column,LeftMargin...
                                ,BottomMargin,gap,gcaFontSize)

