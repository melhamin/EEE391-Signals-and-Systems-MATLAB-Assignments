function [output] = m_point_avg(img, M)     
    output = movmean(img, M, 2); 
end