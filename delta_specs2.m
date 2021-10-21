%Upsampling using interpolation for fixed length of 1 sec.
size_output=1000;
%Interpolate and make minimum value equal to zero.
% A = cellfun(@(input) (interp1(linspace(0,1,length(input)), input, (linspace(0,1,size_output)))+abs(min(input))),si,'UniformOutput',false);
%Divide by max value to make max value equal to one.
% A = cellfun(@(input) input./max(input),A,'UniformOutput',false);
%Compute slope
x1=1;
y1=0;
y2=1;
skew=cellfun(@(input) skewness(input),A,'UniformOutput',false);
skew=[skew{:}];

slope=cellfun(@(input) (y2-y1)/(find(input==1)-x1),A,'UniformOutput',false);
slope=[slope{:}];
angles=atand(slope);
B=cell2mat(A.');
%%
A=deltas;
max_values=[];
long_values=[];
for i=1:length(A)
    [~,l]=max(A{i});
    max_values=[max_values l];
end
max_max_values=max(max_values);
for i=1:length(A)
    [~,l]=max(A{i});
    b=max_max_values-l;
    A{i}=vertcat(nan(b,1),A{i});
    long_values=[long_values length(A{i})];
    plot(A{i})
    hold on
end
max_long_values=max(long_values);
for i=1:length(A)
    b=max_long_values-length(A{i});
    A{i}=vertcat(A{i}, nan(b,1));
end
means=[];
stds=[];
for i=1:max_long_values
    v=[];
    for ii=1:length(A)
        v=[v A{ii}(i,1)];
    end
    means=[means mean(v, 'omitnan')];
    stds=[stds std(v, 'omitnan')];
    clear v
end
