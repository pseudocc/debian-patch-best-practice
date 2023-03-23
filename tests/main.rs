#[cfg(test)]
mod tests {
    use debian_patch_best_practice::add;

#[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);

        let result = add(u32::MAX, 2);
        assert_eq!(result, 1);
    }
}

