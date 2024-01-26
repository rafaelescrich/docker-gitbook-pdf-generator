# Docker Gitbook PDF Generator

> If you want to generate PDFs using GitBook without the hassle, this project is just right for you!

As is well-known, the new version of GitBook uses `calibre` to generate PDFs, which are quite large in size and do not support PDF compression, making them inconvenient for distribution.

After a brief search, I found that **fuergaosi233**, a fellow student, wrote a simple GitBook PDF [generator tool](https://github.com/rafaelescrich/gitbook2pdf) in Python based on `weastprint`. I found it quite good, so I encapsulated this image, hoping it would help others with the same needs.

## How to Use

If the ebook you're generating contains Chinese, you need to prepare at least one font file before use, such as `PingFang` or `Source Han Sans`. Save the file in the **fonts** folder in your current directory.

Then simply use the container image automatically built by DockerHub, along with the file mount parameters.

For example, to turn the content of `http://self-publishing.ebookchain.org` into an ebook, just execute the following command:

```bash
docker run --rm -v `pwd`/fonts:/usr/share/fonts \
                -v `pwd`/output:/app/output \
                rafaelescrich/docker-gitbook-pdf-generator:1.0.0 "http://self-publishing.ebookchain.org"
```

If you are a Windows user and use Powershell, you can use the following command:

```powershell
docker run --rm -v $PWD/fonts:/usr/share/fonts \
                -v $PWD/output:/app/output \
                rafaelescrich/docker-gitbook-pdf-generator:1.0.0 "http://self-publishing.ebookchain.org"
```

After a short wait, you will see the following:

```text
crawl : all done!
Generating pdf, please wait patiently
Generated
```

At this time, a new directory named `output` will automatically appear in your current directory, and the ebook will quietly lie inside.

If you find the above command too complex, you can also use the `docker-compose.yml` template in the repository to generate the ebook. If you're not familiar with how to use it, you can check out the `docker` tutorials in my blog, which usually take about ten minutes to read. Good Luck.

## Other

If you have higher requirements for style, you can modify the style of `/app/gitbook.css` using file mounts.

If you want to know more details, you can read [this blog](https://soulteary.com/2019/05/07/generate-small-gitbook-pdf-using-the-docker-with-python.html).

## Common Issues

- Error during run
    - Error message: “/usr/local/lib/python3.7/site-packages/weasyprint/fonts.py:230: UserWarning: FontConfig: No fonts configured. Expect ugly output. 'FontConfig: No fonts configured. ”
    - Cause of error: Incorrect font mount location, please refer to the latest document for commands. Thanks to the feedback from netizens in the ISSUE.
- Command error in Windows environment
    - Error message: “Error response from daemon: create pwd/fonts: "pwd/fonts" includes invalid characters for a local volume name, only "[a-zA-Z0-9][a-zA-Z0-9_.-]" are allowed. If you intended to pass a host directory, use absolute path.”
    - Cause of error: Windows does not support bash standard syntax, use
- Incorrect Chinese display in generated PDF, displayed as “口口”
    - Solution: Download or copy system fonts to the directory you want to mount, then run the program again.

## License

MIT, For Everyone.