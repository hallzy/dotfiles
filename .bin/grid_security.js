#!/usr/bin/env node


async function getInput(prompt)
{
    const readline = require('readline').createInterface
    (
        {
            input: process.stdin,
            output: process.stdout,
        }
    );

    return new Promise
    (
        resolve =>
        {
            readline.question
            (
                `${prompt} `,
                answer =>
                {
                    readline.close();
                    console.log('');
                    resolve(answer.trim());
                }
            );
        }
    );
}


async function getMultiLineInput(prompt)
{
    const readline = require('readline').createInterface
    (
        {
            input: process.stdin,
            output: process.stdout,
        }
    );

    const input = [];

    console.log(`${prompt}`);

    readline.prompt();

    readline.on(
        'line',
        cmd =>
        {
            input.push(cmd);
        }
    );

    return new Promise
    (
        resolve =>
        {
            readline.on
            (
                'close',
                cmd =>
                {
                    console.log('');
                    resolve(input.join('\n').trim());
                }
            );
        }
    );
}

function parseGrid(rawString)
{
    const ret = {};
    const gridAsArray = rawString.split("\n").map(row => row.split(/[\t ]+/));

    gridAsArray.forEach
    (
        (row, rIdx) =>
        {
            // Skip first row as it is an identifier
            if (rIdx === 0)
            {
                return;
            }

            row.forEach
            (
                (cell, cIdx) =>
                {
                    // Skip first column of each row as it is an identifier
                    if (cIdx === 0)
                    {
                        return;
                    }

                    const cellID = `${gridAsArray[0][cIdx - 1]}${row[0]}`;
                    ret[cellID] = cell;
                }
            );
        }
    );

    return ret;
}


(
    async () =>
    {
        const input = await getMultiLineInput("What is your grid?");
        const grid = parseGrid(input)

        while(1)
        {
            const selection = await getInput("What is your selection?");

            const value = grid[selection] ?? null;

            if (selection === '')
            {
                return;
            }

            if (value)
            {
                console.log(`Value is: ${value}\n`);
            }
            else
            {
                console.log(`Could not find ${selection}\n`);
            }
        }
    }
)();
