"""
Shared fixtures and config for tests.
"""

from __future__ import annotations

import shutil
from collections.abc import Iterator
from pathlib import Path
from typing import Any

import copier
import pytest
import yaml

TEMPLATE_ROOT = Path(__file__).parent.resolve()


@pytest.fixture
def template(tmp_path_factory: pytest.TempPathFactory) -> Iterator[Path]:
    """
    Build a package from the template in a temporary directory,
    yield the directory back to the caller, and then clean it up.

    Yields:
        Path: The temporary directory in which the template has been rendered

    """
    template = tmp_path_factory.mktemp("template")
    copier.run_copy(
        src_path=str(TEMPLATE_ROOT),
        dst_path=str(template),
        data={
            "project_name": "testy",
            "project_slug": "testy",
            "project_type": "binary",
            "description": "A test package for testing",
            "license": "MIT License",
            "github_username": "TestUser",
            "github_url": "https://github.com/TestUser/testy",
            "module_path": "github.com/TestUser/testy",
            "author_name": "Test McTest",
            "author_email": "testmctest@gmail.com",
            "dependency_bot": "renovate",
            "linter": "golangci-lint",
        },
        vcs_ref="HEAD",
    )

    yield template

    shutil.rmtree(template)


@pytest.fixture
def template_vars() -> list[str]:
    """
    Fixture to return a list of all copier template tags to check
    for in build projects to ensure we don't have any partial renders.

    Returns:
        list[str]: List of jinja template variables with brackets e.g. ["{{description}}"]

    """
    copier_yaml = TEMPLATE_ROOT.joinpath("copier.yml")
    with copier_yaml.open() as f:
        data: dict[str, Any] = yaml.safe_load(f)

    return ["{{" + f"{key}" + "}}" for key in data]
