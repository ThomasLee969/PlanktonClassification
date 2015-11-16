function varargout = eigen_imgs(model)
    len = size(model.score, 2);
    eigen_imgs = cell(len, 1);

    for k = 1:len
        eigen_imgs{k} = reshape(model.score(:, k), model.norm_size);
    end

    if ~nargout
        MAX_PLOT_PER_ROW = 10;
        row = ceil(len / MAX_PLOT_PER_ROW);
        col = min(len, MAX_PLOT_PER_ROW);

        for k = 1:len
            subplot(row, col, k);

            img = eigen_imgs{k};
            limit = max(max(abs(img)));

            imshow(mat2gray(img, [-limit, limit]));
            title(['#' int2str(k) ', ' num2str(model.latent(k))]);
        end
    else
        varargout{1} = eigen_imgs;
    end
end