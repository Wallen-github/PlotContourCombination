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

    % Ĭ���ϱ߾����ұ߾�Ϊ0
    % ����ͼ�ĳ���ߴ磬ȫͼ�ܳߴ�Ϊ��1.0��1.0��
    xwidth = (1-LeftMargin)/Column;
    ywidth = (1-BottomMargin)/Row;
    
    % ��������
    figure;
    
    % ˳��һ��Ҫ���Ż�����Ȼ�����ͼƬȱʧ
    for i = Row:-1:1
        for j = Column:-1:1
            
            % ����ÿ��contour�ı��
            Num = (i-1)*Row+j;
            
            % ������ͼ
            subplot(Row,Column,Num)
            
            % ������ͼ
            imagesc(XY(:,2,Num),XY(:,1,Num),ContourData(:,:,Num));
            
            % ��������
            grid on
            
            % ������ͼ����λ��
            xposition = LeftMargin + (j - 1) * xwidth;
            yposition = BottomMargin + (Row - i) * ywidth;
            
            % ������ͼλ�ú��������ʽ
            set(gca,'FontName','Times New Roman','Position'...
                ,[xposition,yposition,xwidth-gap,ywidth-gap]...
                ,'FontSize',gcaFontSize)
            
            % �ж��Ƿ���������ᣬ�����������²����������̶Ⱥ�����
            if (i == Row && j ~= 1)
                % ���� xlabel
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



