%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Description:    This funtion displays a series of contours as a
%                   combination image. The resulting image is an m-by-n 
%                   grid of pixels where m is the number of rows and n is 
%                   the number of columns in C. The row and column indices 
%                   of the elements determine the centers of the
%                   corresponding pixels. Every pixel is a contour.
%
%   Parameters:     XY-array(m,2,index),data of coordinate axis.
%                   ContourData-array(m1,m2,index),a series of m1-by-m2
%                   contour.
%                   Row-int,the number of rows.
%                   Column-int,the number of columns.
%                   LeftMargin-float,the left margin rangng from 0 to 1.
%                   BottomMargin-float,the bottom margin rangng from 0 to 1.
%                   gap-float,the gap between two contours.
%                   gcaFontSize-int,the font siaze of ax.
%
%   Author:         Hai-Shuo Wang
%   Address:        School of Astronomy and Space Science
%                   Nanjing University
%                   China
%   Email:          wanghs@smail.nju.edu.cn
%   Date:           2020.10.27 15:45
%   Version:        2.0
%   Information:    The new version wraps this functionality as a closed
%                   function, including a sample file (PlotContourCombination_Sample.m)
%                   and a data file (PlotContourCombination_Data.mat).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function PlotContourCombination(XY,ContourData,Row,Column,LeftMargin...
                                ,BottomMargin,gap,gcaFontSize)

    % 默认上边距与右边距为0
    % 单张图的长宽尺寸，全图总尺寸为长1.0宽1.0。
    xwidth = (1-LeftMargin)/Column;
    ywidth = (1-BottomMargin)/Row;
    
    % 创建画布
    figure;
    
    % 顺序一定要倒着画，不然会出现图片缺失
    for i = Row:-1:1
        for j = Column:-1:1
            
            % 计算每个contour的编号
            Num = (i-1)*Row+j;
            
            % 创建子图
            subplot(Row,Column,Num)
            
            % 绘制子图
            imagesc(XY(:,2,Num),XY(:,1,Num),ContourData(:,:,Num));
            
            % 绘制网格
            grid on
            
            % 计算子图所在位置
            xposition = LeftMargin + (j - 1) * xwidth;
            yposition = BottomMargin + (Row - i) * ywidth;
            
            % 设置子图位置和坐标轴格式
            set(gca,'FontName','Times New Roman','Position'...
                ,[xposition,yposition,xwidth-gap,ywidth-gap]...
                ,'FontSize',gcaFontSize)
            
            % 判断是否添加坐标轴，仅最左侧和最下侧添加坐标轴刻度和名称
            if (i == Row && j ~= 1)
                % 创建 xlabel
                xlabel('\beta(degree)');
                set(gca,'YDir','normal','yticklabel',[]);
            elseif (j == 1 && i ~= Row)
                ylabel('\alpha/r_0');
                set(gca,'YDir','normal','xticklabel',[]);
            elseif (i == Row && j == 1)
                ylabel('\alpha/r_0');
                xlabel('\beta(degree)');
                set(gca,'YDir','normal');
            else
                set(gca,'xticklabel',[],'yticklabel',[],'YDir','normal');
            end
        end
    end
end



